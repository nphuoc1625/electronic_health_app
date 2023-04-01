// ignore: file_names
import 'package:flutter/material.dart';

import 'testresult_form.dart';

class TestResultPage extends StatelessWidget {
  const TestResultPage({super.key});

  static String routeName = '/testresult';

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
                          title:
                              const Text("Bạn có thay đổi chưa lưu, thoát ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text("Dừng")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Tiếc tục"))
                          ],
                        )).then((value) => {if (value) Navigator.pop(context)});
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text(
            "Tự khai kết quả xét nghiệm",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ListView(
              children: const [
                Text(
                  textAlign: TextAlign.center,
                  "Khuyến cáo: khai báo thông tin sai sự thật là vi"
                  " phạm pháp luật Việt Nam và có thể xử lý hình sự",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 20),
                TestResultForm(),
              ],
            ),
          ),
        ));
  }
}
