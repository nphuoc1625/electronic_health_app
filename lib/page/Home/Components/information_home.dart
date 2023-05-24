import 'package:flutter/material.dart';

import 'coviddata.dart';

class InformationHome extends StatelessWidget {
  const InformationHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      padding: const EdgeInsets.all(30),
      child: Center(
          child: Column(
        children: [
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Chức năng',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          container(context, () {}, 'Hộ chiếu vắc-xin', Icons.library_books,
              Colors.blue),
          const SizedBox(
            height: 12,
          ),
          container(context, () {}, 'Đăng ký tiêm chủng', Icons.vaccines,
              Colors.green),
          const SizedBox(
            height: 12,
          ),
          container(context, () {}, 'Đặt lịch khám', Icons.calendar_month,
              Colors.yellow),
          const SizedBox(
            height: 12,
          ),
          container(context, () {}, 'Hồ sơ sức khỏe', Icons.feedback,
              Colors.purple),
          const SizedBox(
            height: 12,
          ),
          container(
              context,
              () => Navigator.pushNamed(context, CovidData.routeName),
              'Phản ánh tiêm chủng',
              Icons.feedback,
              Colors.red),
          const SizedBox(
            height: 12,
          ),
          container(context, () {
            Navigator.pushNamed(context, CovidData.routeName,
                arguments: CovidData.coviddata);
          }, 'Dữ liệu Covid-19', Icons.bar_chart_outlined, Colors.orange),
        ],
      )),
    );
  }

  GestureDetector container(BuildContext context, void Function() onTap,
      String text, IconData icon, MaterialColor color) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color.fromARGB(255, 255, 255, 255)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    color: color,
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}
