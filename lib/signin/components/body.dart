import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electronic_health_app/signin/components/signin_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: const [
              SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
