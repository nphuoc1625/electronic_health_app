import 'package:electronic_health_app/model/ultilities.dart';
import 'package:electronic_health_app/model/user.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static String routeName = "/sign_up";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var email = TextEditingController();
  final password = TextEditingController();
  final conform = TextEditingController();

  final _fromKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  //Khai bao hien thi password
  bool _passwordVisible = false;
  bool _repasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Form(
          key: _fromKey,
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
                                'Đăng ký',
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
                                  child: Text("Nhập email",
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                              TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
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
                                validator: (emailString) {
                                  return Utilities.validateEmail(emailString!);
                                },
                                onSaved: (value) {
                                  setState(() {
                                    email.text = value!;
                                  });
                                },
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
                                  child: Text("Nhập mật khẩu",
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                              TextFormField(
                                key: _passKey,
                                controller: password,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
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
                                  hintText: "Nhập nội dung",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (passwordKey) {
                                  return Utilities.validatePassword(
                                      passwordKey!);
                                },
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
                                  child: Text("Nhập lại mật khẩu",
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                              TextFormField(
                                controller: conform,
                                obscureText: !_repasswordVisible,
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
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
                                  hintText: "Nhập nội dung",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _repasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _repasswordVisible =
                                            !_repasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (conformPassword) {
                                  var pass = _passKey.currentState?.value;
                                  return Utilities.conformPassword(
                                      conformPassword!, pass);
                                },
                                onSaved: (value) {
                                  setState(() {
                                    conform.text = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
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
                                        horizontal: 130, vertical: 16),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    if (_fromKey.currentState!.validate()) {
                                      Navigator.pop(
                                          context,
                                          User(
                                              username: email.text,
                                              password: conform.text));
                                    }
                                  },
                                  child: const Text('Đăng ký'),
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
          )),
    );
  }
}
