import 'package:flutter/material.dart';
import 'package:electronic_health_app/model/ultilities.dart';
import 'package:electronic_health_app/signup/signuppage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/user.dart';
import '../../page/NavigationBar.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formkey = GlobalKey<FormState>();
  bool value = false;

  final _username = TextEditingController();
  final _password = TextEditingController();
  var _save = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> checkIfSaved() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    if (ref.getString('username') != null) {
      setState(() {
        _username.text = ref.getString('username')!;
        _password.text = ref.getString('password')!;
        _save = true;
      });
    }
  }

  void saveUser() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setString('username', _username.text);
    ref.setString('password', _password.text);
  }

  void deleteUser() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.remove('username');
    ref.remove('password');
  }

  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo1.png", height: 100,color: Colors.blue,),
                  const SizedBox(width: 10,),
                  Column(
                    children: const [
                      Text(
                        "SSKĐT",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Sổ sức khỏe điện tử",
                        style:
                        TextStyle(fontSize: 16, color: Colors.blueAccent),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16,20,16,16),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email",
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      return Utilities.validateEmail(_username.text);
                    },
                    onSaved: (newValue) {},
                    controller: _username,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Nhập email",
                      prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Mật khẩu",
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  TextFormField(
                    controller: _password,
                    validator: (value) {
                      return Utilities.validatePassword(_password.text);
                    },
                    obscureText: !_passwordVisible,
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      hintText: "Nhập mật khẩu",
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.blue,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Checkbox(
                            value: _save,
                            onChanged: ((value) {
                              setState(() {
                                _save = value!;
                              });
                            })
                        ),
                      ),
                      const Text('Ghi nhớ',style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            onclickLogin(context);
                          }
                        },
                        style:  ButtonStyle(
                          shape:
                          const MaterialStatePropertyAll(RoundedRectangleBorder()),
                          backgroundColor: MaterialStatePropertyAll(Colors.blue[800]),
                        ),
                        child: const Text(
                          "Đăng nhập",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Bạn chưa có tài khoản?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () async {
                          Navigator.pushNamed(context, SignUpPage.routeName)
                              .then((value) {
                            if (value != null) {
                              MyUser user = value as MyUser;
                              _username.text = user.email;
                              _password.text = user.pass;
                            }
                          });
                        },
                        child: const Text(
                          "Đăng ký ngay",
                          style:
                              TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Hotline 19009095",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void onclickLogin(BuildContext context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _username.text, password: _password.text);
      if (credential.user != null && mounted) {
        if (_save) {
          saveUser();
        } else {
          deleteUser();
        }
        Navigator.pushNamed(context, MyNavigationBar.routeName);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$e')),
        );
      }
    }
  }
}
