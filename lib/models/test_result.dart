class TestResult {
  String result;
  String time;
  String type;

  TestResult({
    this.result = "",
    this.time = "",
    this.type = "",
  });

  factory TestResult.fromMap(Map map) {
    return TestResult(
      result: map['result'] ?? "",
      time: map['time'] ?? "",
      type: map['type'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'result': result,
      'time': time,
      'type': type,
    };
  }
}

class Vaccine {
  int numberTh;
  String date;
  String name;
  String place;

  Vaccine(
      {required this.numberTh,
      required this.date,
      required this.name,
      required this.place});

  @override
  String toString() {
    return 'Mũi thứ : $numberTh \n'
        'Tên vaccine: $name  \n'
        'Ngày tiêm: $date  \n'
        'Nơi tiêm: $place';
  }

  factory Vaccine.fromMap(Map map) {
    return Vaccine(
      numberTh: map['numberTh'] ?? "",
      date: map['date'] ?? "",
      name: map['name'] ?? "",
      place: map['place'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numberTh': numberTh,
      'date': date,
      'name': name,
      'place': place,
    };
  }
}
