import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'test_result.dart';

class GlobalUserInfo {
  String? uid = '';
  Info? info;
  TestResult? testResult;
  List<Vaccine>? vaccines;
  Declaration? declaration;

  StreamSubscription? _userInfoOnValue;

  static GlobalUserInfo? _instance;
  static GlobalUserInfo get instance {
    if (_instance != null) {
      return _instance!;
    }
    _instance = GlobalUserInfo._internal();
    return _instance!;
  }

  GlobalUserInfo._internal() {
    _litenToUserChange();
  }

  StreamSubscription _litenToUserChange() {
    return FirebaseAuth.instance.userChanges().listen((user) {
      if (user == null && _userInfoOnValue != null) {
        debugPrint('user is null');
        _whenSignedOut();
      }
      if (user != null) {
        debugPrint('user not null');
        uid = user.uid;
        _userInfoOnValue = _litenToUserInfoChange();
      }
    });
  }

  StreamSubscription _litenToUserInfoChange() {
    return FirebaseDatabase.instance.ref('user/$uid').onValue.listen((event) {
      debugPrint(' Obtained data');

      var data = event.snapshot;
      info = Info.fromMap(data.child('info').value as Map);
      testResult = TestResult.fromMap(data.child('test-result').value as Map);

      data.child('declaration').value != null
          ? declaration =
              Declaration.fromMap(data.child('declaration').value as Map)
          : null;

      var vaccinesData = data.child('vaccine').value as List;
      var tempVaccines = <Vaccine>[];
      for (var item in vaccinesData) {
        tempVaccines.add(Vaccine.fromMap(item as Map));
      }
      vaccines = tempVaccines;
      debugPrint('Data updated');
    });
  }

  String vaccinesToString() {
    if (vaccines != null) {
      return vaccines!.fold(
          '',
          (previousValue, element) =>
              previousValue += ' ${element.toString()} \n\n');
    }
    return '';
  }

  void _whenSignedOut() {
    _userInfoOnValue!.cancel();
    uid = null;
    declaration = null;
    info = null;
    testResult = null;
    vaccines = null;
  }
}

class Declaration {
  final String ans1;
  final String ans2;
  final String ans3;

  Declaration({this.ans1 = '', this.ans2 = '', this.ans3 = ''});

  factory Declaration.fromMap(Map map) {
    return Declaration(
        ans1: map['option1'] ?? '',
        ans2: map['option2'] ?? '',
        ans3: map['option3'] ?? '');
  }
  Map<String, String> toMap() {
    return {'option1': ans1, 'option2': ans2, 'option3': ans3};
  }
}

class Info {
  String fullName;
  String birthday;
  int gender;
  String mobile;
  String id;
  String email;
  String province;
  String district;
  String address;
  String ward;

  Info({
    this.fullName = "",
    this.birthday = "",
    this.gender = 0,
    this.mobile = "",
    this.id = "",
    this.email = "",
    this.province = "",
    this.district = "",
    this.address = "",
    this.ward = "",
  });

  factory Info.fromMap(Map map) {
    return Info(
      fullName: map['fullName'] ?? "",
      birthday: map['birthday'] ?? "",
      gender: map['gender'] ?? 0,
      mobile: map['mobile'] ?? "",
      id: map['id'] ?? "",
      email: map['email'] ?? "",
      province: map['province'] ?? "",
      district: map['district'] ?? "",
      address: map['address'] ?? "",
      ward: map['ward'] ?? "",
    );
  }

  Map toMap() {
    return {
      'fullName': fullName,
      'birthday': birthday,
      'gender': gender,
      'mobile': mobile,
      'id': id,
      'email': email,
      'province': province,
      'district': district,
      'address': address,
      'ward': ward,
    };
  }
}
