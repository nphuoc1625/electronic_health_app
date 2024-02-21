import 'package:electronic_health_app/models/global_user_info.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/testresultpage.dart';
import 'package:electronic_health_app/page/Home/Components/Category/category_certification.dart';
import 'package:electronic_health_app/page/Home/Components/Category/category_declaration.dart';
import 'package:electronic_health_app/page/Home/Components/covid_data_page.dart';
import 'package:electronic_health_app/page/Personal/changepassword/changepasswordpage.dart';
import 'package:electronic_health_app/page/Personal/personalinfo/info_page.dart';
import 'package:electronic_health_app/page/Personal/places_arrived/places_arrived_page.dart';
import 'package:electronic_health_app/page/navigation_bar.dart';
import 'package:electronic_health_app/page/signin/signinpage.dart';
import 'package:electronic_health_app/page/signup/signuppage.dart';
import 'package:electronic_health_app/page/splash_page/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GlobalUserInfo.instance;
  runApp(const MyApp());
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
        DeclarationPage.routeName: ((context) => const DeclarationPage()),
        CertificationPage.routeName: ((context) => const CertificationPage()),
        CovidDataPage.routeName: (context) => const CovidDataPage(),
        TestResultPage.routeName: (context) => const TestResultPage(),
        PersonalInfoPage.routeName: (context) => const PersonalInfoPage(),
        ChangePasswordPage.routeName: (context) => const ChangePasswordPage(),
        PlacesArrivedPage.routeName: (context) => const PlacesArrivedPage()
      },
      home: const Splash(),
    );
  }
}
