import 'package:electronic_health_app/page/Home/homepage.dart';
import 'package:electronic_health_app/page/navigationbar.dart';
import 'package:flutter/material.dart';

class CategoryDeclaration extends StatefulWidget {
  static String routeName = "/declaration";
  const CategoryDeclaration({Key? key}) : super(key: key);

  @override
  State<CategoryDeclaration> createState() => _CategoryDeclarationState();
}

// ignore: constant_identifier_names
enum SingingCharacter { No, Yes }

// ignore: constant_identifier_names
enum SingingCharacter1 { No1, Yes1 }

// ignore: constant_identifier_names
enum SingingCharacter2 { No2, Yes2 }

class _CategoryDeclarationState extends State<CategoryDeclaration> {
  SingingCharacter? _character = SingingCharacter.No;
  SingingCharacter1? _character1 = SingingCharacter1.No1;
  SingingCharacter2? _character2 = SingingCharacter2.No2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    label: const Text(
                      '',
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, MyNavigationBar.routeName);
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(70, 8, 0, 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Khai báo y tế",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: 140,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffDDDDDD),
                                blurRadius: 6.0,
                                spreadRadius: 4.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Trong vòng 14 ngày qua, Anh/Chị có đến tỉnh/thành phố,'
                                'quốc gia/vùng lãnh thổ nào',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Radio(
                                        value: SingingCharacter.No,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        },
                                      ),
                                      const Text('Không')
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  Row(
                                    children: [
                                      Radio(
                                        value: SingingCharacter.Yes,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        },
                                      ),
                                      const Text('Có')
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffDDDDDD),
                                blurRadius: 6.0,
                                spreadRadius: 4.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Trong vòng 14 ngày qua, Anh/Chị có thấy xuất hiện ít nhất'
                                '1 trong các dấu hiệu: sốt, ho, khó thở, viêm phổi, đau'
                                'họng, mệt mỏi không?',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Radio(
                                        value: SingingCharacter1.No1,
                                        groupValue: _character1,
                                        onChanged: (SingingCharacter1? value) {
                                          setState(() {
                                            _character1 = value;
                                          });
                                        },
                                      ),
                                      const Text('Không')
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  Row(
                                    children: [
                                      Radio(
                                        value: SingingCharacter1.Yes1,
                                        groupValue: _character1,
                                        onChanged: (SingingCharacter1? value) {
                                          setState(() {
                                            _character1 = value;
                                          });
                                        },
                                      ),
                                      const Text('Có')
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffDDDDDD),
                                blurRadius: 6.0,
                                spreadRadius: 4.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với người bệnh'
                                'hoặc nghi ngờ mắc bệnh COVID-19, người từ nước ngoài có bệnh'
                                'COVID 19',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Radio(
                                        value: SingingCharacter2.No2,
                                        groupValue: _character2,
                                        onChanged: (SingingCharacter2? value) {
                                          setState(() {
                                            _character2 = value;
                                          });
                                        },
                                      ),
                                      const Text('Không')
                                    ],
                                  ),
                                  const SizedBox(width: 50),
                                  Row(
                                    children: [
                                      Radio(
                                        value: SingingCharacter2.Yes2,
                                        groupValue: _character2,
                                        onChanged: (SingingCharacter2? value) {
                                          setState(() {
                                            _character2 = value;
                                          });
                                        },
                                      ),
                                      const Text('Có')
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF0D47A1),
                                      Color(0xFF1976D2),
                                      Color(0xFF42A5F5),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 16),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, HomePage.routeName);
                              },
                              child: const Text('Gửi tờ khai'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
