import 'package:electronic_health_app/model/user.dart';
import 'package:electronic_health_app/page/navigationbar.dart';
import 'package:electronic_health_app/page/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:electronic_health_app/model/ultilities.dart';

class SignInPage extends StatefulWidget {
  static String routeName = "/sign_in";
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  // ignore: prefer_typing_uninitialized_variables
  var prefs;
  final username = TextEditingController();
  final password = TextEditingController();

  FToast? fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);
    _getData();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.getString('username')?.isEmpty) {
      username.text = prefs.getString('username');
      password.text = prefs.getString('password');
      _value = prefs.getBool('check');
    }
  }

  //Khai bao hien thi password
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[900],
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
                child: Row(
                  children: [
                    Image.asset("assets/images/icon.png", height: 100),
                    Column(
                      children: const [
                        Text(
                          "SSKĐT",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Sổ sức khỏe điện tử",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    color: Colors.grey[200],
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                height: 10,
                              ),
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
                                  alignment: Alignment.topLeft,
                                  child: Text("Email",
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  return Utilities.validateEmail(value!);
                                },
                                // ignore: no_leading_underscores_for_local_identifiers
                                onSaved: (_value) {
                                  setState(() {
                                    username.text = _value!;
                                  });
                                },
                                controller: username,
                                decoration: const InputDecoration(
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
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
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
                                  alignment: Alignment.topLeft,
                                  child: Text("Mật khẩu",
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                              TextFormField(
                                controller: password,
                                validator: (value) {
                                  return Utilities.validatePassword(value!);
                                },
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
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
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Quên mật khẩu?",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: 10,),
                          // Row(
                          //   children: [
                          //     Checkbox(
                          //       value: _value ? true : false,
                          //       onChanged: (value) {
                          //         print(_value.toString());
                          //         setState((){
                          //           _value = value!;
                          //         });
                          //       },
                          //     ),
                          //     const Text(
                          //       "Remember me",
                          //       style: TextStyle(color: Colors.green, fontSize: 16),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 30,
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
                                        horizontal: 118, vertical: 16),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    if (_value) {
                                      prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(
                                          "username", username.text);
                                      prefs.setString(
                                          "password", password.text);
                                      prefs.setBool('check', _value);
                                    } else {
                                      prefs.remove("check");
                                    }
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushNamed(
                                        context, MyNavigationBar.routeName);
                                  },
                                  child: const Text('Đăng nhập'),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Bạn chưa có tài khoản?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final result = await Navigator.pushNamed(
                                        context, SignUpPage.routeName);
                                    User? user = result as User?;
                                    username.text = user!.username;
                                  },
                                  child: const Text(
                                    "Đăng ký ngay",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Hotline",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "19009095",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
