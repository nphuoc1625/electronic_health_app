import 'package:electronic_health_app/page/Home/Components/category_home.dart';
import 'package:electronic_health_app/page/Home/Components/information_home.dart';
import 'package:electronic_health_app/page/Home/Components/header_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: const [
                  HeaderHome(),
                  SizedBox(
                    height: 10,
                  ),
                  CategoryHome(),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  color: Colors.grey[200],
                  child: const Center(
                    child: SingleChildScrollView(
                      child: InformationHome(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
