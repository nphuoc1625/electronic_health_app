import 'package:flutter/material.dart';

import 'info_form.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});
  static String routeName = '/personalinfo';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          leading: BackButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Cảnh báo"),
                content: const Text(
                  "Hủy cập nhật thông tin ?",
                  style: TextStyle(color: Colors.red),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text("Hủy"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text("Tiếc tục"),
                  ),
                ],
              ),
            ).then(
              (value) => {
                if (value)
                  {
                    Navigator.pop(context),
                  }
              },
            ),
          ),
          title: const Text("Chỉnh sửa thông tin cá nhân"),
        ),
        body: const PersonalInfoForm(),
      ),
    );
  }
}
