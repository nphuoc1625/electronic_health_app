import 'package:electronic_health_app/page/Calendar/calendar.dart';
import 'package:electronic_health_app/page/Home/homepage.dart';
import 'package:electronic_health_app/page/Notification/notification.dart';
import 'package:electronic_health_app/page/Personal/personal_page.dart';
import 'package:flutter/material.dart';

/// This Widget is the main application widget.

class MyNavigationBar extends StatefulWidget {
  static String routeName = "/navigation";
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const HomePage(),
    const CalendarPage(),
     NotificationPage(),
    const PersonalPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue[600],
                  size: 30,
                ),
                label: ("Trang chủ"),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.calendar_month,
                  color: Colors.black,
                  size: 30,
                ),
                activeIcon: Icon(
                  Icons.calendar_month,
                  color: Colors.blue[600],
                  size: 30,
                ),
                label: ("Lịch hẹn"),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
              activeIcon: Icon(
                Icons.notifications,
                color: Colors.blue[600],
                size: 30,
              ),
              label: ("Thông báo"),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person,
                color: Colors.black,
                size: 30,
              ),
              activeIcon: Icon(
                Icons.person,
                color: Colors.blue[600],
                size: 30,
              ),
              label: ("Cá nhân"),
              backgroundColor: Colors.white,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[600],
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
