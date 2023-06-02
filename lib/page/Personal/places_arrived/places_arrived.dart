import 'package:electronic_health_app/models/global_user_info.dart';
import 'package:electronic_health_app/models/places_arrived.dart';
import 'package:electronic_health_app/page/Personal/places_arrived/places_on_map.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PlacesArrivedPage extends StatefulWidget {
  const PlacesArrivedPage({super.key});
  static const String routeName = '/places-arrived';
  @override
  State<PlacesArrivedPage> createState() => _PlacesArrivedPageState();
}

class _PlacesArrivedPageState extends State<PlacesArrivedPage> {
  List<ArrivedByDate> listDates = [];

  void fetch() {
    FirebaseDatabase.instance
        .ref('user/${GlobalUserInfo.instance.uid}/places-arrived')
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        listDates = snapshot.children
            .map((e) => ArrivedByDate(e.key!, _buildPlacesList(e)))
            .toList();
        setState(() {});
      }
    });
  }

  List<PlacesArrived> _buildPlacesList(DataSnapshot date) {
    return date.children.map((e) => PlacesArrived.fromDS(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: const Text('Nơi đã đến '),
              actions: [
                TextButton.icon(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlacesOnMap(),
                        )),
                    icon: const Text('Xem trên bản đồ',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    label: const Icon(
                      Icons.map_outlined,
                      color: Colors.white,
                      size: 30,
                    ))
              ]),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: listDates.isNotEmpty
                ? ListView.builder(
                    itemCount: listDates.length,
                    itemBuilder: (context, index) {
                      return _dateItems(listDates[index]);
                    },
                  )
                : const Center(
                    child: Text(
                    'Chưa có khai báo nào',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
          )),
    );
  }

  Widget _dateItems(ArrivedByDate arrivedByDate) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              arrivedByDate.date,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...dateChildren(arrivedByDate.placesArrived)
        ],
      ),
    );
  }

  List<Widget> dateChildren(List<PlacesArrived> places) {
    return List<Widget>.generate(
        places.length,
        (index) => Row(
              children: [
                Text('\u2022 ${places[index].locationId}'),
              ],
            ));
  }
}
