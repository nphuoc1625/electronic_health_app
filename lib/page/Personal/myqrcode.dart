import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQRCode extends StatefulWidget {
  const MyQRCode({super.key});

  @override
  State<MyQRCode> createState() => _MyQRCodeState();
}

class _MyQRCodeState extends State<MyQRCode> {
  String data = "Không có dữ liệu";

  getUserInfo() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref('user/$uid/info');
    DataSnapshot snapshot = await ref.get();
    if (snapshot.exists) {
      var value = snapshot.value as Map;
      data = "Họ và tên: ${value['fullname']}\n";
      data += "Ngày sinh: ${value['birthday']}\n";
      var gender = '';
      switch (value['gender']) {
        case 0:
          gender = 'Nữ';
          break;
        case 1:
          gender = 'Nam';
          break;
        case 2:
          gender = 'Khác';
          break;
        default:
      }
      data += "Giới tính: $gender\n";
      data += "Số điện thoại: ${value['mobile']}\n";
      data += "Email: ${value['email']}\n";

      setState(() {});
    }
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

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
            data:
                'https://tokhaiyte.vn/?page=Group.checkin&groupId=5e89726392bd2184ae730883',
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            'Mã thẻ thông tin Covid',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        TextButton.icon(
            onPressed: () {
              getUserInfo();
            },
            icon: const Icon(Icons.refresh_outlined),
            label: const Text("Bấm để đồng bộ"))
      ],
    );
  }
}
