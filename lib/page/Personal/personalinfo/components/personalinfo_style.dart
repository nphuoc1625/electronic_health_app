import 'package:flutter/material.dart';

class PersonalInfoStyle {
  static final birthdayFormStyle = InputDecoration(
      border: const OutlineInputBorder(),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Row(children: const [
        Text("Ngày sinh"),
        Text("*", style: TextStyle(color: Colors.red))
      ]),
      suffixIcon: const Icon(
        Icons.calendar_month_outlined,
        color: Colors.blue,
      ));
}
