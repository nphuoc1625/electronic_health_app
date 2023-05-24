import 'package:electronic_health_app/page/navigation_bar.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyNavigationBar.routeName);
            },
          ),
          title: const Text(
            "Khai báo y tế",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              children: [
                Expanded(
                  child: ListView(shrinkWrap: true, children: [
                    itemContainer(Column(
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
                                Row(children: [
                                  Radio(
                                      value: SingingCharacter.Yes,
                                      groupValue: _character,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character = value;
                                        });
                                      }),
                                  const Text('Có')
                                ])
                              ])
                        ])),
                    const SizedBox(
                      height: 20,
                    ),
                    itemContainer(Column(
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
                                Row(children: [
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
                                ])
                              ])
                        ])),
                    const SizedBox(
                      height: 20,
                    ),
                    itemContainer(Column(
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
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 16),
                                textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyNavigationBar.routeName);
                            },
                            child: const Text('Gửi tờ khai')),
                      ),
                    ),
                    const SizedBox(height: 15)
                  ]),
                ),
              ],
            ),
          ),
        ));
  }

  Widget itemContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: boxDecoration,
      child: child,
    );
  }

  var boxDecoration = const BoxDecoration(
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
  );
}
