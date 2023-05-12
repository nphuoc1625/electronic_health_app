import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class TestResultMenu extends StatelessWidget {
  TestResultMenu(this.results, {super.key});
  List<String> results;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return TextButton(
              onPressed: () {
                Navigator.pop(context, results[index]);
              },
              child: Text(results[index]));
        });
  }
}
