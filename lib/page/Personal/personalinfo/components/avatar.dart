import 'package:flutter/material.dart';

class InfoAvatar extends StatelessWidget {
  const InfoAvatar(this.image, this.validate, {super.key});
  final Image? image;
  final bool validate;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        decoration: BoxDecoration(
            image: image != null ? DecorationImage(image: image!.image) : null,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                color: validate ? Colors.green : Colors.red, width: 3)),
        clipBehavior: Clip.antiAlias,
        width: 200,
        height: 200,
        child: image == null
            ? const Icon(
                Icons.person_outline_outlined,
                size: 150,
                color: Colors.grey,
              )
            : null,
      ),
    );
  }
}
