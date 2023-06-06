import 'package:electronic_health_app/models/validator.dart';
import 'package:electronic_health_app/page/navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../models/global_user_info.dart';

class CategoryDeclaration extends StatefulWidget {
  static String routeName = "/declaration";
  const CategoryDeclaration({Key? key}) : super(key: key);

  @override
  State<CategoryDeclaration> createState() => _CategoryDeclarationState();
}

// ignore: constant_identifier_names
enum Question1 { no, yes }

// ignore: constant_identifier_names
enum Question2 { no, yes }

// ignore: constant_identifier_names
enum Question3 { no, yes }

class _CategoryDeclarationState extends State<CategoryDeclaration> {
  Question1? _question1 = Question1.no;
  Question2? _question2 = Question2.no;
  Question3? _question3 = Question3.no;

  final TextEditingController _ans1 = TextEditingController();
  final TextEditingController _ans2 = TextEditingController();
  final TextEditingController _ans3 = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void fetch() {
    Declaration? declaration = GlobalUserInfo.instance.declaration;
    if (declaration != null) {
      if (declaration.ans1.isNotEmpty) {
        _ans1.text = declaration.ans1;
        _question1 = Question1.yes;
      }
      if (declaration.ans2.isNotEmpty) {
        _ans2.text = declaration.ans2;
        _question2 = Question2.yes;
      }
      if (declaration.ans3.isNotEmpty) {
        _ans3.text = declaration.ans3;
        _question3 = Question3.yes;
      }
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    fetch();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _ans1.dispose();
    _ans2.dispose();
    _ans3.dispose();
    super.dispose();
  }

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
        body: SafeArea(
          child: Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(children: [
                itemContainer(
                  'Trong vòng 14 ngày qua, Anh/Chị có đến tỉnh/thành phố,'
                  'quốc gia/vùng lãnh thổ nào',
                  Radio<Question1>(
                    value: Question1.no,
                    groupValue: _question1,
                    onChanged: (Question1? value) {
                      setState(() {
                        _question1 = value;
                      });
                    },
                  ),
                  Radio<Question1>(
                      value: Question1.yes,
                      groupValue: _question1,
                      onChanged: (Question1? value) {
                        setState(() {
                          _question1 = value;
                        });
                      }),
                  Visibility(
                    visible: (_question1 == Question1.yes) ? true : false,
                    child: TextFormField(
                      validator: (value) {
                        return Validator.isEmpty(value);
                      },
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      controller: _ans1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                itemContainer(
                    'Trong vòng 14 ngày qua, Anh/Chị có thấy xuất hiện ít nhất'
                    '1 trong các dấu hiệu: sốt, ho, khó thở, viêm phổi, đau'
                    'họng, mệt mỏi không?',
                    Radio<Question2>(
                      value: Question2.no,
                      groupValue: _question2,
                      onChanged: (Question2? value) {
                        setState(() {
                          _question2 = value;
                        });
                      },
                    ),
                    Radio<Question2>(
                      value: Question2.yes,
                      groupValue: _question2,
                      onChanged: (Question2? value) {
                        setState(() {
                          _question2 = value;
                        });
                      },
                    ),
                    Visibility(
                        visible: (_question2 == Question2.yes) ? true : false,
                        child: TextFormField(
                          validator: (value) {
                            return Validator.isEmpty(value);
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          controller: _ans2,
                        ))),
                const SizedBox(
                  height: 20,
                ),
                itemContainer(
                    'Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc với người bệnh hoặc nghi ngờ mắc bệnh COVID-19, người từ nước ngoài có bệnh COVID 19',
                    Radio<Question3>(
                      value: Question3.no,
                      groupValue: _question3,
                      onChanged: (Question3? value) {
                        setState(() {
                          _question3 = value;
                        });
                      },
                    ),
                    Radio<Question3>(
                      value: Question3.yes,
                      groupValue: _question3,
                      onChanged: (Question3? value) {
                        setState(() {
                          _question3 = value;
                        });
                      },
                    ),
                    Visibility(
                        visible: (_question3 == Question3.yes) ? true : false,
                        child: TextFormField(
                          validator: (value) {
                            return Validator.isEmpty(value);
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          controller: _ans3,
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Container(
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
                      onPressed: () => onPress(),
                      child: const Text('Gửi tờ khai')),
                ),
                const SizedBox(height: 15)
              ]),
            ),
          ),
        ));
  }

  void onPress() {
    if (!_formKey.currentState!.validate()) return;
    var a1 = '', a2 = '', a3 = '';
    if (_question1 == Question1.yes) a1 = _ans1.text;
    if (_question2 == Question2.yes) a2 = _ans2.text;
    if (_question3 == Question3.yes) a3 = _ans3.text;

    FirebaseDatabase.instance
        .ref('user')
        .child(GlobalUserInfo.instance.uid!)
        .child('declaration')
        .set(Declaration(ans1: a1, ans2: a2, ans3: a3).toMap())
        .then((value) {
      //if from scan return true if success else return null
      if (ModalRoute.of(context)?.settings.arguments == 'fromScan') {
        Navigator.pop(context, true);
      }
    });
  }

  Widget itemContainer(
      String title, Radio radio1, Radio radio2, Visibility visibility) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [radio1, const Text('Không')],
              ),
              const SizedBox(width: 50),
              Row(
                children: [radio2, const Text('Có')],
              ),
            ],
          ),
          visibility
        ],
      ),
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
