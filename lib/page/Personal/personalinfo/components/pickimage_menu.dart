import 'package:electronic_health_app/page/Personal/personalinfo/components/takepicture.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageMenu extends StatefulWidget {
  const PickImageMenu(this.onAddedImage, {super.key});

  final void Function(XFile image) onAddedImage;

  @override
  State<PickImageMenu> createState() => _PickImageMenuState();
}

class _PickImageMenuState extends State<PickImageMenu> {
  void _pickImage(ImageSource source, BuildContext context) {
    ImagePicker picker = ImagePicker();
    picker.pickImage(source: source, maxWidth: 1080).then((value) async {
      if (value != null) {
        widget.onAddedImage(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<XFile>(
                  builder: (context) {
                    return const TakeFacePicture();
                  },
                )).then((value) {
                  if (value != null) {
                    widget.onAddedImage(value);
                  }
                });
              },
              child: const Column(
                children: [Icon(Icons.camera_alt), Text("Chụp ảnh")],
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: VerticalDivider(
                    width: 20, thickness: 1, color: Colors.grey)),
            TextButton(
              onPressed: () {
                _pickImage(ImageSource.gallery, context);
              },
              child: const Column(
                children: [Icon(Icons.camera_alt), Text("Thư viện")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
