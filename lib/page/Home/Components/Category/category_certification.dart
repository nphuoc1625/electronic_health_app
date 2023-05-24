import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CategoryCertification extends StatefulWidget {
  static String routeName = "/certification";
  const CategoryCertification({Key? key}) : super(key: key);

  @override
  State<CategoryCertification> createState() => _CategoryCertificationState();
}

class _CategoryCertificationState extends State<CategoryCertification> {
  var _birthday = '';
  var _name = '';
  var _id = '';
  var _vaccineState = "BẠN CHƯA TIÊM MŨI NÀO";
  void getData() {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    //Vaccine
    FirebaseDatabase.instance.ref('user/$uid/vaccine').get().then((value) {
      if (value.exists && value.children.isNotEmpty) {
        setState(() {
          _vaccineState = 'ĐÃ TIÊM ${value.children.length} MŨI VẮC XIN';
        });
      }
    });

    //info
    FirebaseDatabase.instance.ref('user/$uid/info').get().then((value) {
      if (value.exists) {
        Map data = value.value as Map;
        _name = data['fullname'];
        _birthday = data['birthday'];
        _id = data['id'];
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Chứng nhận ngừa Covid",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.green[800],
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        color: Colors.green[800],
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Icon(
                  Icons.security,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  _vaccineState,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 160.0,
                  width: 160.0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/code_certification.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Thông tin cá nhân',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      columnItem(
                          Icons.text_format_outlined, 'Họ và tên', _name),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      columnItem(Icons.calendar_month_outlined, 'Ngày sinh',
                          _birthday),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      columnItem(Icons.add_card_outlined,
                          'Số hộ chiếu/CMND/CCCD', _id),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.green,
                                Colors.lightGreen,
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 16),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        child: const Text('Cập nhật thông tin tiêm'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget columnItem(IconData icon, String title, String value) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Icon(
            icon,
            size: 30,
            color: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      ))),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ))
            ]),
          )
        ]));
  }
}
