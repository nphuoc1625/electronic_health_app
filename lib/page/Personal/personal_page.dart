import 'package:electronic_health_app/models/global_user_info.dart';
import 'package:electronic_health_app/page/Personal/changepassword/changepasswordpage.dart';
import 'package:electronic_health_app/page/Personal/myqrcode.dart';
import 'package:electronic_health_app/page/Personal/personalinfo/info_page.dart';
import 'package:electronic_health_app/page/Personal/places_arrived/places_arrived.dart';
import 'package:electronic_health_app/page/signin/signinpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  String username = '';
  getUsername() {
    username = GlobalUserInfo.instance.info!.fullName;
  }

  @override
  void initState() {
    getUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue[900],
        child: SingleChildScrollView(
          child: Column(children: [
            AppBar(
              backgroundColor: Colors.blue[900],
              leading: Image.asset(
                'assets/images/icons.png',
                fit: BoxFit.cover,
              ),
              title: Text(username),
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Đăng xuất'),
                        content:
                            const Text('Bạn thật sự muốn đăng xuất tài khoản'),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Hủy bỏ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              FirebaseAuth.instance.signOut().then((value) =>
                                  Navigator.popAndPushNamed(
                                      context, SignInPage.routeName));
                            },
                            child: const Text(
                              'Đăng xuất',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: FittedBox(fit: BoxFit.fill, child: MyQRCode()),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    TextButton(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.person,
                                    color: Colors.black, size: 30),
                              ),
                              Text('Thông tin cá nhân',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18))
                            ],
                          ),
                          Icon(Icons.navigate_next,
                              color: Colors.black, size: 30)
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, PersonalInfo.routeName);
                      },
                    ),
                    divider(context),
                    TextButton(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.location_on,
                                    color: Colors.black, size: 30),
                              ),
                              Text('Nơi đã đến',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18))
                            ],
                          ),
                          Icon(Icons.navigate_next,
                              color: Colors.black, size: 30)
                        ],
                      ),
                      onPressed: () => Navigator.pushNamed(
                          context, PlacesArrivedPage.routeName),
                    ),
                    divider(context),
                    TextButton(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.help_outline_sharp,
                                    color: Colors.black, size: 30),
                              ),
                              Text('Giới thiệu',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18))
                            ],
                          ),
                          Icon(Icons.navigate_next,
                              color: Colors.black, size: 30)
                        ],
                      ),
                      onPressed: () {},
                    ),
                    divider(context),
                    TextButton(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.password_outlined,
                                    color: Colors.black, size: 30),
                              ),
                              Text('Đổi mật khẩu',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18))
                            ],
                          ),
                          Icon(Icons.navigate_next,
                              color: Colors.black, size: 30)
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, ChangePasswordPage.routeName);
                      },
                    ),
                    divider(context),
                    TextButton(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.logout,
                                    color: Colors.black, size: 30),
                              ),
                              Text('Đăng xuất',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18))
                            ],
                          ),
                          Icon(Icons.navigate_next,
                              color: Colors.black, size: 30)
                        ],
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut().then((value) =>
                            Navigator.popAndPushNamed(
                                context, SignInPage.routeName));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }

  Widget divider(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: Colors.grey,
    );
  }
}
