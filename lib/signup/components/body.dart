import 'package:flutter/material.dart';
import './signup_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(children: [
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
            const SignUpForm()
          ]),
        ),
      ),
    );
  }
}
