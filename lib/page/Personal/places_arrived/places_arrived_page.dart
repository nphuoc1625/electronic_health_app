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
            .map((date) => ArrivedByDate.fromSnapShot(date))
            .toList();
        setState(() {});
      }
    });
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
              backgroundColor: Colors.blue[900],
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
          body: listDates.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: listDates.length,
                    itemBuilder: (context, index) {
                      return _dateItems(listDates[index]);
                    },
                  ),
                )
              : const Center(
                  child: Text(
                  'Chưa có khai báo nào',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))),
    );
  }

  Widget _dateItems(ArrivedByDate arrivedByDate) {
    return Card(
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(8.0),
        backgroundColor: Colors.blue[100],
        collapsedBackgroundColor: Colors.blue[400],
        initiallyExpanded: true,
        textColor: Colors.blue[900],
        title: Text(
          '${arrivedByDate.date} (${arrivedByDate.weekDay})',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: [...dateChildren(arrivedByDate.placesArrived)],
      ),
    );
  }

  List<Widget> dateChildren(List<PlacesArrived> places) {
    return List<Widget>.generate(
        places.length,
        (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${places[index].time}: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Flexible(
                    child: Text(
                      maxLines: 4,
                      '${places[index].name} ',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ));
  }
}
