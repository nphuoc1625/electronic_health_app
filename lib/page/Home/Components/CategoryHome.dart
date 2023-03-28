import 'package:electronic_health_app/page/Home/Components/Category/CategoryCertification.dart';
import 'package:electronic_health_app/page/Home/Components/Category/CategoryDeclaration.dart';
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
        TextButton(
          onPressed: (){Navigator.pushNamed(context, CategoryDeclaration.routeName);},
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 100,
            height: 140,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: Colors.blue[400]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(50)),
                        child: Container(
                            padding: const EdgeInsets.all(13),
                            color: Colors.white,
                            child: Icon(
                              Icons.library_books,
                              color: Colors.blue[400],
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:20.0),
                      child: Text(
                        'Khai báo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'Y tế',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
        TextButton(
          onPressed: (){Navigator.pushNamed(context, CategoryCertification.routeName);},
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 100,
            height: 140,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.green),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(50)),
                        child: Container(
                            padding: const EdgeInsets.all(13),
                            color: Colors.white,
                            child: const Icon(
                              Icons.add_moderator,
                              color: Colors.green,
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:20.0),
                      child: Text(
                        'Chứng nhận',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'ngừa Covid',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
        TextButton(
          onPressed: (){},
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 100,
            height: 140,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.redAccent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(50)),
                        child: Container(
                            padding: const EdgeInsets.all(13),
                            color: Colors.white,
                            child: const Icon(
                              Icons.library_books,
                              color: Colors.redAccent,
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:20.0),
                      child: Text(
                        'Tư vấn',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'sức khỏe F0',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}