import 'package:flutter/widgets.dart';

class TestResult {
  String type;
  DateTime datetime;
  String result;

  Image? image;

  TestResult(this.type, this.datetime, this.result);

  String get date {
    return datetime.toString().split(' ').first;
  }

  String get time {
    return datetime.toString().split(' ').last;
  }

  factory TestResult.fromMap(Map map) {
    return TestResult(
        map['type']!, DateTime.parse(map['time']!), map['result']!);
  }
  Map<String, String> toMap() {
    return {'type': type, 'time': datetime.toString(), 'result': result};
  }
}
