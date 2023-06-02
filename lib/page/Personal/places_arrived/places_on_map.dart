import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesOnMap extends StatefulWidget {
  const PlacesOnMap({super.key});

  @override
  State<PlacesOnMap> createState() => _PlacesOnMapState();
}

class _PlacesOnMapState extends State<PlacesOnMap> {
  var position = const CameraPosition(zoom: 10, target: LatLng(10, 100));

  GoogleMap? map;
  Set<Marker> markers = {};

  Future<Position> _determinePosition() async {
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

    return await Geolocator.getCurrentPosition();
  }

  Future<Set<Marker>> _placeArrived() async {
    return {
      const Marker(markerId: MarkerId('1'), position: LatLng(10.6, 106.8)),
      const Marker(markerId: MarkerId('2'), position: LatLng(10.8, 106.6)),
      const Marker(markerId: MarkerId('3'), position: LatLng(10.4, 106.4))
    };
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _determinePosition().then((value) {
          position = CameraPosition(
              zoom: 10, target: LatLng(value.latitude, value.longitude));
          map = GoogleMap(
              compassEnabled: true,
              mapToolbarEnabled: true,
              markers: markers,
              initialCameraPosition: position);
          setState(() {});
        });

        _placeArrived().then(
          (value) {
            markers = value;
            setState(() {});
          },
        );
      },
    );
  }

  void goToCurrent() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _determinePosition(),
              icon: const Icon(Icons.replay_outlined))
        ],
      ),
      body: map ?? const Center(child: CircularProgressIndicator()),
    );
  }
}
