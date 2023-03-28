import 'package:flutter/material.dart';
import 'package:electronic_health_app/page/SignInPage.dart';

class SplashPage extends StatelessWidget {
  static String routeName="/splash";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
     Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushNamedAndRemoveUntil(
          context, SignInPage.routeName,(Route<dynamic>route) => false);
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:const BoxDecoration(
              color: Color(0xFF0D47A1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 5,
              ),
              SizedBox(height: 5,),
              Text("Loading...",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),)
            ],
          ),
        ),
      ),
    );
  }
}

