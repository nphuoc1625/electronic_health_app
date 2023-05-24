import 'package:flutter/material.dart';

class PersonalInfoStyle {
  static const birthdayFormStyle = InputDecoration(
      border: OutlineInputBorder(),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Row(children: [
        Text("Ngày sinh"),
        Text("*", style: TextStyle(color: Colors.red))
      ]),
      suffixIcon: Icon(
        Icons.calendar_month_outlined,
        color: Colors.blue,
      ));
}
