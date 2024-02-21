import 'package:electronic_health_app/page/Home/Components/Category/TestResult/testresultpage.dart';
import 'package:electronic_health_app/page/Home/Components/Category/category_declaration.dart';
import 'package:flutter/material.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome(
    this.size, {
    super.key,
  });
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DeclarationPage.routeName);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              width: size.width / 3.5,
              height: size.height / 4.5,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: Colors.blue[400]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(13),
                    child: const Icon(
                      Icons.library_books,
                      color: Colors.green,
                      size: 40,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: const Text(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      'Khai báo \n Y tế',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
              Navigator.pushNamed(context, DeclarationPage.routeName);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              width: size.width / 3.5,
              height: size.height / 4.5,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.green),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(13),
                    child: const Icon(
                      Icons.add_moderator,
                      color: Colors.green,
                      size: 40,
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    'Chứng nhận \n ngừa Covid',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
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
              width: size.width / 3.5,
              height: size.height / 4.5,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.redAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(13),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.redAccent,
                      size: 40,
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    'Kết quả \n xét nghiệm',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
