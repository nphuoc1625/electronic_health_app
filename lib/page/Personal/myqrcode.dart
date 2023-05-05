import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQRCode extends StatelessWidget {
  const MyQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: QrImage(
            data: "Hello",
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: Text(
            'Mã thẻ thông tin Covid',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        // TextButton.icon(
        //     onPressed: () {},
        //     icon: const Icon(Icons.refresh_outlined),
        //     label: const Text("Bấm để đồng bộ"))
      ],
    );
  }
}
