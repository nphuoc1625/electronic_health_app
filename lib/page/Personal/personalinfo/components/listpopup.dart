import 'package:flutter/material.dart';

class ChooseFromList extends StatelessWidget {
  const ChooseFromList(this._lists, {super.key});
  final List _lists;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _lists.length,
      itemBuilder: (context, index) {
        return TextButton(
            onPressed: () {
              Navigator.pop(context, [_lists[index].name, index]);
            },
            child: Text(_lists[index].name));
      },
    );
  }
}
