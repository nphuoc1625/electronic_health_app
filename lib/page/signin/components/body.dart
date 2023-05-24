import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electronic_health_app/page/signin/components/signin_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            SignInForm(),
          ],
        ),
      ),
    );
  }
}
