import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class TakeFacePicture extends StatefulWidget {
  const TakeFacePicture({Key? key}) : super(key: key);

  @override
  State<TakeFacePicture> createState() => _TakeFacePictureState();
}

class _TakeFacePictureState extends State<TakeFacePicture> {
  late CameraController _cameraController;
  bool _cameraInitialized = false;

  late final FaceDetectorOptions options;
  late final FaceDetector faceDetector;

  bool faceDetected = false;
  bool processingImage = false;
  InputImage? detectedImage;
  void _initializeCamera() async {
    // Get list of cameras of the device
    List<CameraDescription> cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }

    CameraDescription frontCamera = cameras.firstWhere(
      (element) => element.lensDirection == CameraLensDirection.front,
      orElse: () {
        return cameras[0];
      },
    );
    // Create the CameraController
    _cameraController =
        CameraController(frontCamera, ResolutionPreset.veryHigh);

    // Initialize the CameraController
    _cameraController.initialize().then((_) async {
      // Start ImageStream
      await _cameraController.startImageStream(
          (CameraImage image) => _processCameraImage(image, frontCamera));

      setState(() {
        _cameraInitialized = true;
      });
    });
  }

  void _processCameraImage(
      CameraImage cameraImage, CameraDescription cameraDescription) async {
    if (!mounted) {
      return;
    }
    if (processingImage) {
      return;
    } else {
      processingImage = true;
      List<int> allBytes = [];
      for (Plane plane in cameraImage.planes) {
        allBytes.addAll(plane.bytes.toList());
      }
      var bytes = Uint8List.fromList(allBytes);

      Size imageSize =
          Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

      InputImageRotation? imageRotation = InputImageRotationValue.fromRawValue(
          cameraDescription.sensorOrientation);

      InputImageFormat? inputImageFormat =
          InputImageFormatValue.fromRawValue(cameraImage.format.raw);

      var planeData = cameraImage.planes.map(
        (Plane plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList();

      var inputImageData = InputImageData(
        size: imageSize,
        imageRotation: imageRotation!,
        inputImageFormat: inputImageFormat!,
        planeData: planeData,
      );

      var inputImage =
          InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

      List<Face> faces = await FaceDetector(options: FaceDetectorOptions())
          .processImage(inputImage);

      processingImage = false;

      if (faces.isNotEmpty) {
        faceDetected = true;
        detectedImage = inputImage;
      } else {
        faceDetected = false;
      }
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    options = FaceDetectorOptions();
    faceDetector = FaceDetector(options: options);
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            (_cameraInitialized)
                ? CameraPreview(
                    _cameraController,
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: faceDetected ? Colors.green : Colors.red,
                                width: 5),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  )
                : const CircularProgressIndicator(),
            detectedImage != null
                ? Image.memory(detectedImage!.bytes!)
                : Container(),
            IconButton(
                onPressed: () {
                  if (detectedImage != null) {
                    _cameraController
                        .takePicture()
                        .then((value) => {Navigator.pop(context, value)});
                  }
                },
                icon: const Icon(size: 100, Icons.adjust_rounded))
          ],
        ),
      ),
    );
  }
}
