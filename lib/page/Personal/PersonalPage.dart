import 'package:electronic_health_app/page/Personal/myqrcode.dart';
import 'package:electronic_health_app/page/Personal/personalinfo/personal_info.dart';
import 'package:electronic_health_app/page/SignInPage.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
            backgroundColor: Colors.blue[900],
            leading: Image.asset(
              'assets/images/icons.png',
              fit: BoxFit.cover,
            ),
            title: const Text('Trần Hoài Sơn'),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text('Đăng xuất'),
                                content: const Text(
                                    'Bạn thật sự muốn đăng xuất tài khoản'),
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
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, SignInPage.routeName);
                                      },
                                      child: const Text(
                                        'Đăng xuất',
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ]));
                  },
                  icon: const Icon(Icons.logout))
            ]),
        body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(children: [
              const MyQRCode(),
              Expanded(
                  child: SingleChildScrollView(
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 10),
                              color: Colors.white,
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextButton(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Icon(Icons.person,
                                                    color: Colors.black,
                                                    size: 30),
                                              ),
                                              Text('Thông tin cá nhân',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18))
                                            ]),
                                            const Icon(Icons.navigate_next,
                                                color: Colors.black, size: 30)
                                          ]),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, PersonalInfo.routeName);
                                      },
                                    ),
                                    divider(context),
                                    TextButton(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Icon(Icons.location_on,
                                                    color: Colors.black,
                                                    size: 30),
                                              ),
                                              Text('Nơi đã đến',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18))
                                            ]),
                                            const Icon(Icons.navigate_next,
                                                color: Colors.black, size: 30)
                                          ]),
                                      onPressed: () {},
                                    ),
                                    divider(context),
                                    TextButton(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Icon(
                                                    Icons.help_outline_sharp,
                                                    color: Colors.black,
                                                    size: 30),
                                              ),
                                              Text('Giới thiệu',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18))
                                            ]),
                                            const Icon(Icons.navigate_next,
                                                color: Colors.black, size: 30)
                                          ]),
                                      onPressed: () {},
                                    ),
                                    divider(context),
                                    TextButton(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Icon(Icons.settings,
                                                    color: Colors.black,
                                                    size: 30),
                                              ),
                                              Text('Cài đặt',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18))
                                            ]),
                                            const Icon(Icons.navigate_next,
                                                color: Colors.black, size: 30)
                                          ]),
                                      onPressed: () {},
                                    )
                                  ])))))
            ])));
  }

  Widget divider(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: Colors.grey,
    );
  }
}
