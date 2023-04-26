import 'package:flutter/material.dart';
import './components/body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          "Đăng ký",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Body()),
    );
  }
}
