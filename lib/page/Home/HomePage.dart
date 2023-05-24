import 'package:electronic_health_app/page/Home/Components/category_home.dart';
import 'package:electronic_health_app/page/Home/Components/information_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  String name = 'Trần Hoài Sơn';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue[900],
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                shadowColor: Colors.black,
                backgroundColor: Colors.blue[900],
                leading: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    child: Image.asset(
                      'assets/images/icons.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  'Hello $name',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.blue[300])),
                        onPressed: () {},
                        icon: const Icon(
                          size: 30,
                          Icons.notifications,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryHome(MediaQuery.of(context).size),
              ),
              const InformationHome()
            ],
          ),
        ));
  }
}
