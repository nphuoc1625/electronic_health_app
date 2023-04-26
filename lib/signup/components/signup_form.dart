import 'package:electronic_health_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:electronic_health_app/model/ultilities.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var email = TextEditingController();
  var password = TextEditingController();
  var conformPass = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  //Khai bao hien thi password
  bool _passwordVisible = false;
  bool _repasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(16),
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
              emailTextFormField(),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Mật khẩu",
                      style: TextStyle(fontSize: 18)),
                ),
              ),
              passwordTextFormField(),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Xác nhận mật khẩu",
                      style: TextStyle(fontSize: 18)),
                ),
              ),
              conformTextFormField(),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          onClickRegister(context);
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[800]),
                          shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))))),
                      child: const Text("Đăng ký",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
              ),
              const SizedBox(height: 30),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 40,
              //       width: 40,
              //       decoration: const BoxDecoration(
              //           color: Color(0xFFF5F6F9), shape: BoxShape.circle),
              //       child: SvgPicture.asset("assets/icons/facebook.svg"),
              //     ),
              //     Container(
              //       height: 40,
              //       width: 40,
              //       decoration: const BoxDecoration(
              //           color: Color(0xFFF5F6F9), shape: BoxShape.circle),
              //       child: SvgPicture.asset("assets/icons/google.svg"),
              //     ),
              //     Container(
              //       height: 40,
              //       width: 40,
              //       decoration: const BoxDecoration(
              //           color: Color(0xFFF5F6F9), shape: BoxShape.circle),
              //       child: SvgPicture.asset("assets/icons/twitter.svg"),
              //     )
              //   ],
              // ),
            ],
          ),
        ));
  }

  emailTextFormField() {
    return TextFormField(
      validator: (value) => Utilities.validateEmail(value!),
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {},
      controller: email,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        hintText: "Nhập email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.email,color: Colors.blue,),
      ),

    );
  }

  passwordTextFormField() {
    return TextFormField(
      key: _passKey,
      validator: (value) => Utilities.validatePassword(value!),
      obscureText: !_passwordVisible,
      keyboardType: TextInputType.text,
      onSaved: (newValue) {},
      controller: password,
      decoration:  InputDecoration(
        border: const OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        hintText: "Nhập mật khẩu",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.lock_outline_rounded,color: Colors.blue,),
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
    );
  }

  conformTextFormField() {
    return TextFormField(
      validator: (value) {
        String pass = _passKey.currentState!.value;
        return Utilities.conformPassword(pass, value!);
      },
      keyboardType: TextInputType.text,
      obscureText: !_repasswordVisible,
      onSaved: (newValue) {},
      controller: conformPass,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        hintText: "Nhập lại mật khẩu",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(Icons.lock_outline_rounded,color: Colors.blue,),
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
    );
  }

  onClickRegister(BuildContext context) async {
    ScaffoldMessenger.of(context).clearSnackBars();
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      if (credential.user != null && mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Register Success")));
        Navigator.pop(context, MyUser(email.text, password.text));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("$e.mess")));
    }
  }
}
