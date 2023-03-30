import 'package:flutter/material.dart';

class Validator {
  static simpleValidator(String? value) {
    if (value!.isEmpty) {
      return 'Vui lòng nhập loại xét nghiệm';
    }
    return null;
  }

  static imageValidator(Image? value) {
    if (value != null) {
      return 'Vui lòng nhập loại xét nghiệm';
    }
    return null;
  }
}
