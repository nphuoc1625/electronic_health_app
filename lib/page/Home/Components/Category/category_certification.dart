import 'package:electronic_health_app/page/navigationbar.dart';
import 'package:flutter/material.dart';

class CategoryCertification extends StatelessWidget {
  static String routeName = "/certification";
  const CategoryCertification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      color: Colors.green[800],
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
                                    Navigator.pushNamed(
                                        context, MyNavigationBar.routeName);
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Chứng nhận ngừa Covid",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 80),
                              child: Icon(
                                Icons.security,
                                size: 80,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                            child: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "ĐÃ TIÊM 02 MŨI VẮC XIN",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                            child: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: SizedBox(
                              height: 160.0,
                              width: 160.0,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  'assets/images/code_certification.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 40, 0, 0),
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
                          Padding(
                              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  height: 300,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.person,
                                              size: 30,
                                              color: Colors.black54,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                'Họ tên',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 56.0),
                                        child: Row(
                                          children: const [
                                            Text(
                                              'Trần Hoài Sơn',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.date_range,
                                              size: 30,
                                              color: Colors.black54,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                'Ngày sinh',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 56.0),
                                        child: Row(
                                          children: const [
                                            Text(
                                              '12/07/2001',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.add_card_outlined,
                                              size: 30,
                                              color: Colors.black54,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                'Số hộ chiếu/CMND/CCCD',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 56.0),
                                        child: Row(
                                          children: const [
                                            Text(
                                              '21235648243',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
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
                                          horizontal: 76, vertical: 16),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          CategoryCertification.routeName);
                                    },
                                    child:
                                        const Text('Cập nhật thông tin tiêm'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
