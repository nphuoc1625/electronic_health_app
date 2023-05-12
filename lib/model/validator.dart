import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

class Validator {
  static String? Empty(String? value) {
    if (value!.isEmpty) {
      return "Không được để trống";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    Empty(value);

    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value!)) {
      return "Nhập email hợp lệ";
    } else {
      return null;
    }
  }
  //

  static String? validatePassword(String value) {
    Empty(value);
    if (value.length < 8) {
      return "Mật khẩu phải nhiều hơn 8 ký tự";
    }
    return null;
  }

  static String? conformPassword(String value, String value2) {
    Empty(value);
    Empty(value2);
    if (!equalsIgnoreCase(value, value2)) {
      return "Mật khẩu nhập lại không hợp lệ";
    }
    return null;
  }

  static dateValidator(String? date) {
    Empty(date);

    return null;
  }

  static imageValidator(Image? value) {
    if (value == null) {
      return "Không được để trống";
    }
    return null;
  }
}
