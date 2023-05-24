import 'package:flutter/material.dart';

class TestResultMenu extends StatelessWidget {
  const TestResultMenu(this.results, {super.key});
  final List<String> results;
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
