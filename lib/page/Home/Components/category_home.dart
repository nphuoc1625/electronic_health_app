import 'package:electronic_health_app/page/Home/Components/Category/category_certification.dart';
import 'package:electronic_health_app/page/Home/Components/Category/category_declaration.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/testresult.dart';
import 'package:flutter/material.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CategoryDeclaration.routeName);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 100,
            height: 140,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: Colors.blue[400]),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                        padding: const EdgeInsets.all(13),
                        color: Colors.white,
                        child: Icon(
                          Icons.library_books,
                          color: Colors.blue[400],
                        ))),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    'Khai báo \n Y tế',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CategoryCertification.routeName);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 100,
            height: 140,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.green),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                        padding: const EdgeInsets.all(13),
                        color: Colors.white,
                        child: const Icon(
                          Icons.add_moderator,
                          color: Colors.green,
                        ))),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    'Chứng nhận \n ngừa Covid',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, TestResultPage.routeName);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 100,
            height: 140,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.redAccent),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Container(
                        padding: const EdgeInsets.all(13),
                        color: Colors.white,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.redAccent,
                        ))),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    'Kết quả \n xét nghiệm',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
