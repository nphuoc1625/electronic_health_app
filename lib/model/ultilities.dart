import 'package:quiver/strings.dart';

class Utilities{

  static String? validateEmail(String value){
    if(value.isEmpty){
      return "Vui lòng nhập email";
    }

    RegExp regex= RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if(!regex.hasMatch(value))
      return "Nhập email hợp lệ";
    else
      return null;
  }
  //

  static String? validatePassword(String value){
    if(value.isEmpty)
    {
      return "Vui lòng nhập mật khẩu";
    }
    if(value.length<8){
      return "Mật khẩu phải nhiều hơn 8 ký tự";
    }
  }
  static String? conformPassword(String value, String value2){
    if(!equalsIgnoreCase(value, value2))
      return "Mật khẩu nhập lại không hợp lệ";
  }
}