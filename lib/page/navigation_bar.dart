import 'package:electronic_health_app/page/Calendar/calendar.dart';
import 'package:electronic_health_app/page/Home/homepage.dart';
import 'package:electronic_health_app/page/Notification/notification.dart';
import 'package:electronic_health_app/page/Personal/personal_page.dart';
import 'package:electronic_health_app/page/qrscan.dart';
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

  final List<Widget?> _widgetOptions = [
    const HomePage(),
    const CalendarPage(),
    null,
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
    return SafeArea(
      child: Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ElevatedButton(
          style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(80, 80)),
              shape: MaterialStatePropertyAll(CircleBorder())),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const QRScanning();
            }));
          },
          child: const Icon(
            Icons.qr_code_scanner_outlined,
            size: 40,
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            unselectedIconTheme:
                const IconThemeData(color: Colors.black, size: 40),
            showUnselectedLabels: false,
            selectedFontSize: 20,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue[600],
            iconSize: 40,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: ("Trang chủ"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                ),
                label: ("Lịch hẹn"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                  size: 0,
                ),
                label: (""),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: ("Thông báo"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: ("Cá nhân"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
