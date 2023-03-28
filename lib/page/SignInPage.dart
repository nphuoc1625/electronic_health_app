import 'package:electronic_health_app/page/Home/HomePage.dart';
import 'package:electronic_health_app/page/SignUpPage.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static String routeName="/sign_in";
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
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
                            'Đăng nhập',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
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

                              prefixIcon: Icon(Icons.person,color: Colors.blue,),
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
                              hintText: "Nhập mật khẩu",

                              prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.blue,),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Align(
                          alignment:Alignment.bottomRight,
                          child: Text("Quên mật khẩu?",style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
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
                                padding: const EdgeInsets.symmetric(horizontal: 118, vertical: 16),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {Navigator.pushNamed(context,HomePage.routeName);},
                              child: const Text('Đăng nhập'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                        child: Align(
                          alignment:Alignment.bottomCenter,
                          child: Row(
                            children: [
                              const Text("Bạn chưa có tài khoản?",style: TextStyle(fontSize: 18),),
                              TextButton(
                                onPressed: () {Navigator.pushNamed(context, SignUpPage.routeName);},
                                child: const Text('Đăng ký ngay', style: TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.normal),),
                              ),
                            ], 
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Hotline",style: TextStyle(fontSize: 18),),
                            SizedBox(width: 5,),
                            Text("19009095",style: TextStyle(fontSize: 18,color: Colors.blue),),
                          ],
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
