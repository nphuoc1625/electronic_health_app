import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesArrived {
  final String locationId;
  final String time;
  final LatLng geoLocation;

  PlacesArrived(this.locationId, this.time, this.geoLocation);

  factory PlacesArrived.fromDS(DataSnapshot dataSnapshot) {
    var data = dataSnapshot.value as Map;
    return PlacesArrived(dataSnapshot.key ?? '', data['time'],
        LatLng(data['geolocation']['latitude'], data['geolocation']['longitude']));
  }
}

class ArrivedByDate {
  final String date;
  final List<PlacesArrived> placesArrived;
  ArrivedByDate(this.date, this.placesArrived);
}
