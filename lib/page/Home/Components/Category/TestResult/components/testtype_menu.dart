import 'package:flutter/material.dart';

class TestTypeMenu extends StatelessWidget {
  const TestTypeMenu(this.type, {super.key});
  final List<String> type;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: type.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.of(context).pop(type[index]);
          },
          title: Text(type[index]),
        );
      },
    );
  }
}
