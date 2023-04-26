import 'package:electronic_health_app/page/Home/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
  }

  void checkIfUserLoggedIn(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => checkIfUserLoggedIn(context));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[800],
        title: const Center(
          child: Text(
            "Đăng nhập",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Body()),
    );
  }
}
