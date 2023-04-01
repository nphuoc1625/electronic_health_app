import 'package:electronic_health_app/page/Home/Components/CovidData.dart';
import 'package:flutter/material.dart';

import '../../models/mynotification.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({Key? key}) : super(key: key);

  List<MyNotification> notifications = [MyNotification()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Thông báo"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: notifications.length + 1,
          itemBuilder: (context, index) {
            if (notifications.isEmpty) {
              return emptyList();
            }
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CovidData.routeName,
                    arguments:
                        'https://expressjs.com/en/starter/hello-world.html');
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    height: 140,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Ca COVID-19 nặng tăng; Những biến thể phụ nào xuất hiện tại Việt Nam?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            "Theo thống kê của Bộ Y tế, số ca mắc mới COVID-19  "
                            "và bệnh nhân nặng đang tăng nhẹ; Kết quả giải trình "
                            "tự gen COVID-19 của hai miền Nam, Bắc năm 2022; Các đơn"
                            " vị phối hợp với các tổ chức, chuyên gia trong nước, quốc tế theo dõi, cập nhật tình hình dịch, nhất là các biến thể mới.",
                            style: TextStyle(fontSize: 16),
                          )
                        ])),
              ),
            );
          }),
    );
  }

  Widget emptyList() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
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
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Rất tiếc, chưa có dữ liệu hiển thị",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
