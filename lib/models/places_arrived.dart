import 'package:electronic_health_app/models/global_user_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesArrived {
  final String locationId;
  final String name;
  final String time;
  final LatLng geoLocation;
  final Declaration declaration;
  PlacesArrived(this.locationId, this.name, this.time, this.declaration,
      this.geoLocation);

  factory PlacesArrived.fromDS(DataSnapshot dataSnapshot) {
    var data = dataSnapshot.value as Map;
    return PlacesArrived(
        dataSnapshot.key ?? '',
        data['name'],
        data['time'],
        Declaration.fromMap(data['declaration']),
        LatLng(
            data['geolocation']['latitude'], data['geolocation']['longitude']));
  }
}

class ArrivedByDate {
  final String date;
  final String weekDay;
  final List<PlacesArrived> placesArrived;

  ArrivedByDate(this.date, this.weekDay, this.placesArrived);

  factory ArrivedByDate.fromSnapShot(DataSnapshot dateSnapShot) {
    List<PlacesArrived> list =
        dateSnapShot.children.map((e) => PlacesArrived.fromDS(e)).toList();
    return ArrivedByDate(dateSnapShot.key!.split(' ')[0],
        pairWeekDay(int.parse(dateSnapShot.key!.split(' ')[1])), list);
  }

  static String pairWeekDay(int weekDay) {
    switch (weekDay) {
      case 1:
        return "Thứ 2";
      case 2:
        return "Thứ 3";
      case 3:
        return "Thứ 4";
      case 4:
        return "Thứ 5";
      case 5:
        return "Thứ 6";
      case 6:
        return "Thứ bảy";
      case 7:
        return "Chủ Nhật";
    }
    return 'invalid week day';
  }
}
