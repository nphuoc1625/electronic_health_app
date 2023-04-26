import 'package:electronic_health_app/page/Home/Components/Category/category_certification.dart';
import 'package:electronic_health_app/page/Home/Components/Category/category_declaration.dart';
import 'package:electronic_health_app/page/Home/Components/CovidData.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/testresult.dart';
import 'package:electronic_health_app/page/Home/HomePage.dart';
import 'package:electronic_health_app/page/navigation_bar.dart';
import 'package:electronic_health_app/page/Personal/personalinfo/personal_info.dart';
import 'package:electronic_health_app/page/splash_page/splash_screen.dart';
import 'package:electronic_health_app/page/signin/signinpage.dart';
import 'package:electronic_health_app/page/signup/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        Splash.routeName: (context) => const Splash(),
        SignInPage.routeName: ((context) => const SignInPage()),
        SignUpPage.routeName: ((context) => const SignUpPage()),
        MyNavigationBar.routeName: ((context) => const MyNavigationBar()),
        CategoryDeclaration.routeName: ((context) =>
            const CategoryDeclaration()),
        CategoryCertification.routeName: ((context) =>
            const CategoryCertification()),
        CovidData.routeName: (context) => const CovidData(),
        TestResultPage.routeName: (context) => const TestResultPage(),
        PersonalInfo.routeName: (context) => const PersonalInfo()
      },
      home: const Splash(),
    );
  }
}
