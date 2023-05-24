import 'package:flutter/material.dart';

class TestResultStyles {
  static const typeFormDecoration = InputDecoration(
    border: OutlineInputBorder(),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Loại xét nghiệm", style: TextStyle(fontSize: 18)),
        Text("*", style: TextStyle(color: Colors.red, fontSize: 18))
      ],
    ),
    suffixIcon: Icon(
      Icons.keyboard_arrow_down_outlined,
      color: Colors.blue,
    ),
  );

  static const resultFormDecoration = InputDecoration(
    border: OutlineInputBorder(),
    label: Row(
      children: [
        Text("Kết quả"),
        Text(
          "*",
          style: TextStyle(color: Colors.red),
        ),
      ],
    ),
    suffixIcon: Icon(
      Icons.keyboard_arrow_down_outlined,
      color: Colors.blue,
    ),
  );

  static const dateFormDecoration = InputDecoration(
      border: OutlineInputBorder(),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Row(children: [
        Text("Ngày lấy mẫu"),
        Text("*", style: TextStyle(color: Colors.red))
      ]),
      suffixIcon: Icon(
        Icons.calendar_month_outlined,
        color: Colors.blue,
      ));
}
