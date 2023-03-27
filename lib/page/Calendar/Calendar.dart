import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Lịch hẹn',style: TextStyle(fontSize: 22,color: Colors.white),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Container(
                    padding: const EdgeInsets.only(top:30),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Image.asset(
                            "assets/images/notification.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top:10),
                          child: Text("Rất tiếc, chưa có dữ liệu hiển thị",
                            style: TextStyle(fontSize: 16),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )

      ),
    );
  }
}
