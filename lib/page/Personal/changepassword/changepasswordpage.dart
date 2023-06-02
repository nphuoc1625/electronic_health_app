import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});
  static const routeName = '/changepassword';

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  String? curPass, newPass, reNew;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 50),
                          child: Text(
                            'Đổi mật khẩu',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          initialValue: curPass,
                          decoration: inputDecoration('Mật khẩu cũ'),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          initialValue: newPass,
                          decoration: inputDecoration('Mật khẩu mới'),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          initialValue: reNew,
                          decoration:
                              inputDecoration('Nhập lại mật khẩu mới'),
                        ),
                        const SizedBox(height: 50),
                        TextButton(
                            style: ButtonStyle(
                                overlayColor:
                                    MaterialStatePropertyAll(Colors.blue[800]),
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                backgroundColor:
                                    const MaterialStatePropertyAll(Colors.blue),
                                fixedSize: const MaterialStatePropertyAll(
                                    Size(300, 50))),
                            onPressed: () {},
                            child: const Text(
                              'Đổi mật khẩu',
                            ))
                      ]))))),
    );
  }

  InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide(width: 3)),
        hintText: hintText);
  }
}
