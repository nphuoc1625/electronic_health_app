import 'package:electronic_health_app/page/Personal/places_arrived/places_arrived.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanning extends StatefulWidget {
  const QRScanning({super.key});

  @override
  State<QRScanning> createState() => _QRScanningState();
}

class _QRScanningState extends State<QRScanning> {
  late final MobileScannerController _controller;
  bool showingResult = false;
  @override
  void initState() {
    _controller =
        MobileScannerController(detectionSpeed: DetectionSpeed.normal);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Quét mã QR'),
      ),
      body: Stack(
        children: [
          Expanded(
            child: MobileScanner(
              controller: _controller,
              onDetect: (capture) => _handleCode(capture),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                'Đặt camera trước mã để quét',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          _controller.switchCamera();
                        },
                        icon: const Icon(size: 40, Icons.replay_outlined),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          _controller.toggleTorch();
                        },
                        icon: Icon(
                            size: 40,
                            _controller.torchEnabled
                                ? Icons.flash_off_outlined
                                : Icons.flash_on_outlined),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PlacesArrived.routeName);
                      },
                      child: const Text(
                        'Nơi đã đến',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  _handleCode(BarcodeCapture capture) {
    if (showingResult) return;

    showingResult = true;

    final Barcode barcode = capture.barcodes[0];
    if (barcode.url != null && barcode.url!.url != null) {
      Uri url = Uri.parse(barcode.url!.url!);
      if (url.host == 'electrical-health-care.com' &&
          url.pathSegments[0] == 'declaration') {
        _makeDelare(url.queryParameters['id']!);
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('${barcode.displayValue}'),
            actions: [
              TextButton(
                  onPressed: () => copyToClipBoard(barcode.displayValue!),
                  child: const Text('Sao chép'))
            ],
          );
        },
      ).then((value) => showingResult = false);
    }
  }

  void copyToClipBoard(String data) {
    Clipboard.setData(ClipboardData(text: data)).then((value) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Đã lưu',
          style: TextStyle(color: Colors.red, fontSize: 24),
        ),
        duration: Duration(milliseconds: 1000),
      ));
    });
  }

  void _makeDelare(String id) {
    //makeDecleration  https://electrical-health-care.com/declaration?id="HUFLIT"
    debugPrint('_makeDelare to $id');
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseDatabase.instance
        .ref('declaration/$id')
        .push()
        .set({'uid': uid, 'time': DateTime.now().toIso8601String()});
    //whenDonw
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: Row(
            children: [Icon(Icons.done), Text('Đã khai báo')],
          ),
        );
      },
    ).then((value) => showingResult = false);
  }
}
