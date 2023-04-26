import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

class CovidData extends StatelessWidget {
  const CovidData({super.key});
  static String routeName = "/coviddata";
  static String coviddata = 'https://covid19.ncsc.gov.vn/dulieu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Browser(
        initialUriString: ModalRoute.of(context)!.settings.arguments as String,
        topBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }
}
