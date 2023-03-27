import 'package:electronic_health_app/page/SignInPage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static String routeName="/sign_up";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
                child: Row(
                  children: [
                    Image.asset("assets/images/icon.png",height: 100),
                    Column(
                      children: const[
                        Text("SSKĐT",style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        Text("Sổ sức khỏe điện tử",style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                        ),),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50), topRight: Radius.circular(50)
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            SizedBox(height: 10,),
                            Text(
                              'Đăng ký',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Align(
                                alignment:Alignment.topLeft,
                                child: Text("Họ và tên",style: TextStyle(fontSize: 18)),
                              ),
                            ),
                            TextFormField(
                              decoration:const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                hintText: "Nhập nội dung",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Align(
                                alignment:Alignment.topLeft,
                                child: Text("Số điện thoại",style: TextStyle(fontSize: 18)),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:  OutlineInputBorder(
                                  borderSide:  BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                hintText: "Nhập nội dung",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Align(
                                alignment:Alignment.topLeft,
                                child: Text("Mật khẩu",style: TextStyle(fontSize: 18)),
                              ),
                            ),
                            TextFormField(
                              decoration:const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                hintText: "Nhập nội dung",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 132, vertical: 15),
                          ),
                          onPressed: () {Navigator.pushNamed(context, SignInPage.routeName);},
                          child: const Text('Đăng kí', style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );

  }
}
