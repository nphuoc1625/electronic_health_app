import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class TestTypeMenu extends StatelessWidget {
  TestTypeMenu(this.type, {super.key});
  List<String> type;
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
