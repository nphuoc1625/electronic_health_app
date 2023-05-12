import 'package:flutter/material.dart';

class TestResultStyles {
  static final typeFormDecoration = InputDecoration(
    border: const OutlineInputBorder(),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text("Loại xét nghiệm", style: TextStyle(fontSize: 18)),
        Text("*", style: TextStyle(color: Colors.red, fontSize: 18))
      ],
    ),
    suffixIcon: const Icon(
      Icons.keyboard_arrow_down_outlined,
      color: Colors.blue,
    ),
  );

  static final resultFormDecoration = InputDecoration(
    border: const OutlineInputBorder(),
    label: Row(
      children: const [
        Text("Kết quả"),
        Text(
          "*",
          style: TextStyle(color: Colors.red),
        ),
      ],
    ),
    suffixIcon: const Icon(
      Icons.keyboard_arrow_down_outlined,
      color: Colors.blue,
    ),
  );

  static final dateFormDecoration = InputDecoration(
      border: const OutlineInputBorder(),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Row(children: const [
        Text("Ngày lấy mẫu"),
        Text("*", style: TextStyle(color: Colors.red))
      ]),
      suffixIcon: const Icon(
        Icons.calendar_month_outlined,
        color: Colors.blue,
      ));
}
