import 'dart:convert';
import 'package:flutter/services.dart';

class Province {
  List<District> districs = [];
  String name;
  int code;

  Province(this.name, this.code, this.districs);

  factory Province.fromMap(Map<String, dynamic> map) {
    var district = map['districts'];
    var districts = district.map<District>((e) => District.fromMap(e)).toList();
    return Province(map['name'], map['code'], districts);
  }

  static Future<List<Province>> _provinceFromFile() async {
    // var path = await getApplicationDocumentsDirectory();
    // File file = File('${path.path}/provinces.json');
    // var json = jsonDecode(await file.readAsString());
    var json =
        jsonDecode(await rootBundle.loadString('assets/data/province.json'));
    // print(json);
    return json.map<Province>((e) => Province.fromMap(e)).toList();
  }

  static Future<List<Province>> getAllProvinces() async {
    // var path = await getApplicationDocumentsDirectory();
    // File file = File('${path.path}/provinces.json');

    // if (!await file.exists()) {
    // print('get provinces from File');
    return _provinceFromFile();
    // }

    // print('get provinces from Web');
    // var uri = Uri.parse('https://provinces.open-api.vn/api/?depth=3');

    // var result = await http.get(uri, headers: {
    //   // 'Content-Type': 'application/json',
    //   // HttpHeaders.contentEncodingHeader: 'br,utf-8',
    //   // // HttpHeaders.acceptEncodingHeader: 'gzip, deflate, br',
    //   // HttpHeaders.acceptHeader: '*/*',
    //   // HttpHeaders.transferEncodingHeader: 'chunked'
    // });

    // if (result.statusCode == 200) {
    //   await file.writeAsString(result.body);
    //   return _provinceFromFile();
    // }
    // return [];
  }
}

class District {
  List<Ward> wards;
  String name;
  int code;

  District(this.name, this.code, this.wards);

  factory District.fromMap(Map<String, dynamic> map) {
    var ward = map['wards'];
    var wards = ward.map<Ward>((e) => Ward.fromMap(e)).toList();

    return District(map['name'], map['code'], wards);
  }
}

class Ward {
  String name;
  int code;
  Ward(this.name, this.code);

  factory Ward.fromMap(Map<String, dynamic> map) {
    return Ward(map['name'], map['code']);
  }
}
