import 'package:flutter/material.dart';

import 'coviddata.dart';

class InformationHome extends StatelessWidget {
  const InformationHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Thông tin y tế',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Icon(Icons.more_horiz),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Container(
                          padding: const EdgeInsets.all(13),
                          color: Colors.blue,
                          child: const Icon(
                            Icons.library_books,
                            color: Colors.white,
                          ))),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Hộ chiếu vắc-xin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Container(
                          padding: const EdgeInsets.all(13),
                          color: Colors.orange,
                          child: const Icon(
                            Icons.vaccines,
                            color: Colors.white,
                          ))),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Đăng ký tiêm chủng',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Container(
                          padding: const EdgeInsets.all(13),
                          color: Colors.pinkAccent,
                          child: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ))),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Đặt lịch khám',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Container(
                          padding: const EdgeInsets.all(13),
                          color: Colors.indigo,
                          child: const Icon(
                            Icons.file_copy,
                            color: Colors.white,
                          ))),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Hồ sơ sức khỏe',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Container(
                          padding: const EdgeInsets.all(13),
                          color: Colors.green,
                          child: const Icon(
                            Icons.feedback,
                            color: Colors.white,
                          ))),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Phản ánh tiêm chủng',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CovidData.routeName,
                arguments: CovidData.coviddata);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Container(
                            padding: const EdgeInsets.all(13),
                            color: Colors.red,
                            child: const Icon(
                              Icons.bar_chart_outlined,
                              color: Colors.white,
                            ))),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Dữ liệu Covid-19',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
