import 'package:electronic_health_app/models/global_user_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/places_arrived.dart';

class PlacesOnMap extends StatefulWidget {
  const PlacesOnMap({super.key});

  @override
  State<PlacesOnMap> createState() => _PlacesOnMapState();
}

class _PlacesOnMapState extends State<PlacesOnMap> {
  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // return await Geolocator.getCurrentPosition();
  }

  Future<GoogleMap?> _fetchPlacesArrived() async {
    DataSnapshot snapshot = await FirebaseDatabase.instance
        .ref('user/${GlobalUserInfo.instance.uid}/places-arrived')
        .get();

    if (snapshot.exists) {
      var list = snapshot.children
          .map((date) => ArrivedByDate.fromSnapShot(date))
          .toList();

      var placesArriveds = list.fold<List<PlacesArrived>>([],
          (previousValue, element) => previousValue + element.placesArrived);

      var markers = <Marker>{};
      for (var i = 0; i < placesArriveds.length; i++) {
        var marker = Marker(
            markerId: MarkerId('$i'),
            position: LatLng(placesArriveds[i].geoLocation.latitude,
                placesArriveds[i].geoLocation.longitude));
        markers.add(marker);
      }

      var position = CameraPosition(zoom: 12, target: markers.first.position);
      return GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          compassEnabled: true,
          mapToolbarEnabled: true,
          markers: markers,
          initialCameraPosition: position);
    }
    return const GoogleMap(
        compassEnabled: true,
        mapToolbarEnabled: true,
        markers: {},
        initialCameraPosition: CameraPosition(
            zoom: 12, target: LatLng(10.876115089572636, 106.7676823345676)));
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _fetchPlacesArrived(),
              icon: const Icon(Icons.replay_outlined))
        ],
      ),
      body: FutureBuilder(
        future: _fetchPlacesArrived(),
        builder: (context, snapshot) {
          return snapshot.data != null
              ? snapshot.data!
              : const CircularProgressIndicator();
        },
      ),
    );
  }
}
