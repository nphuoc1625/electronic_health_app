// ignore: file_names
import 'package:flutter/material.dart';

import 'testresult_form.dart';

class TestResultPage extends StatefulWidget {
  const TestResultPage({super.key});

  static String routeName = '/testresult';

  @override
  State<TestResultPage> createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage> {
  // final  GlobalKey<State<TestResultForm>> _myWidgetState = GlobalKey<State<TestResultForm>>();

  // onSaveClick(){
  //   _myWidgetState.currentState!.
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            //warning if unsaved
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Bạn có thay đổi chưa lưu, thoát ?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("Dừng"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Tiếc tục"),
                  )
                ],
              ),
            ).then((value) => {if (value) Navigator.pop(context)});
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Tự khai kết quả xét nghiệm",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: const TestResultForm(),
      ),
    );
  }
}
