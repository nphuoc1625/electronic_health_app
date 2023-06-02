import 'dart:io';

import 'package:camera/camera.dart';
import 'package:electronic_health_app/models/test_result.dart';
import 'package:electronic_health_app/models/global_user_info.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/components/pickimage_menu.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/components/style.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/components/testresult_menu.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/components/testtype_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../../models/validator.dart';

class TestResultForm extends StatefulWidget {
  const TestResultForm({super.key});

  @override
  State<TestResultForm> createState() => _TestResultFormState();
}

class _TestResultFormState extends State<TestResultForm> {
  final _formKey = GlobalKey<FormState>();
  final _testType = TextEditingController();
  final _time = TextEditingController();
  final _date = TextEditingController();
  final _result = TextEditingController();

  Image? addedImages;
  String? imagepath;
  DateTime time = DateTime.now();

  List<String> result = ['Âm tính', 'Dương tính'];
  List<String> type = [
    'Xét nghiệm PCR',
    'Xét nghiệm kháng thể',
    'Xét nghiệm kháng nguyên',
    'Genexpert'
  ];

  fetch() async {
    TestResult? data = GlobalUserInfo.instance.testResult;
    if (data != null) {
      _testType.text = data.type;
      _result.text = data.result;

      _date.text = data.time.split(' ')[0];
      _time.text = data.time.split(' ')[1];

      var imageData = await FirebaseStorage.instance
          .ref('user/${GlobalUserInfo.instance.uid}/testresult_image.png')
          .getData();
      addedImages = Image.memory(imageData!);
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetch();
  }

  @override
  void dispose() {
    _testType.dispose();
    _time.dispose();
    _date.dispose();
    _result.dispose();
    super.dispose();
  }

  void onAddedImage(XFile image) async {
    addedImages = Image.memory(await image.readAsBytes());
    imagepath = image.path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      "Khuyến cáo: khai báo thông tin sai sự thật là vi"
                      " phạm pháp luật Việt Nam và có thể xử lý hình sự",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      textAlign: TextAlign.center,
                      "Thông tin xét nghiệm ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _testType,
                      keyboardType: TextInputType.none,
                      onTap: () {
                        showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return TestTypeMenu(type);
                                },
                                constraints:
                                    const BoxConstraints(maxHeight: 200))
                            .then((value) => value != null
                                ? _testType.text = value
                                : _testType.text = '');
                      },
                      decoration: TestResultStyles.typeFormDecoration,
                      validator: (value) => Validator.isEmpty(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Giờ lấy mẫu"),
                              suffixIcon: Icon(
                                Icons.watch_later_outlined,
                                color: Colors.blue,
                              ),
                            ),
                            keyboardType: TextInputType.none,
                            controller: _time,
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then(
                                (value) {
                                  if (value != null) {
                                    time.copyWith(
                                      hour: value.hour,
                                      minute: value.minute,
                                    );
                                    _time.text =
                                        "${value.hour}:${value.minute}";
                                  }
                                },
                              );
                            },
                            validator: (value) => Validator.isEmpty(value),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: _date,
                            keyboardType: TextInputType.none,
                            onTap: () {
                              showDatePicker(
                                      lastDate: DateTime.now(),
                                      firstDate: DateTime(2019),
                                      context: context,
                                      initialDate: DateTime.now())
                                  .then((value) {
                                if (value != null) {
                                  setState(() {
                                    time.copyWith(
                                        day: value.day,
                                        month: value.month,
                                        year: value.year);
                                    _date.text =
                                        "${value.day}/${value.month}/${value.year}";
                                  });
                                }
                              });
                            },
                            decoration: TestResultStyles.dateFormDecoration,
                            validator: (value) =>
                                Validator.dateValidator(value),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _result,
                      keyboardType: TextInputType.none,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return TestResultMenu(result);
                          },
                          constraints: const BoxConstraints(maxHeight: 200),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        ).then((value) =>
                            value != null ? {_result.text = value} : {});
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Validator.isEmpty(value),
                      decoration: TestResultStyles.resultFormDecoration,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Minh chứng kết quả xét nghiệm ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        "Có thể là giấy chứng nhận hoặc ảnh chụp kit test nhanh"),
                    const SizedBox(height: 20),
                    FormField<Image>(
                      initialValue: addedImages,
                      builder: (field) {
                        return Column(
                          children: [
                            field.errorText != null
                                ? Text(
                                    field.errorText!,
                                    style: const TextStyle(color: Colors.red),
                                  )
                                : const SizedBox(),
                            addedImages != null
                                ? Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                        addedImages!,
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  addedImages = null;
                                                  imagepath = null;
                                                });
                                              },
                                              icon: const Icon(
                                                size: 40,
                                                Icons.close,
                                                color: Colors.red,
                                              )),
                                        )
                                      ])
                                : const SizedBox()
                          ],
                        );
                      },
                      validator: (value) =>
                          addedImages == null ? 'Thiếu ảnh minh chứng ' : null,
                    ),
                    PickImageMenu(onAddedImage),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) save();
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                minimumSize: MaterialStatePropertyAll(Size.fromHeight(60))),
            child: const Text('Lưu',
                style: TextStyle(color: Colors.white, fontSize: 26)),
          )
        ],
      ),
    );
  }

  void save() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    TestResult result = TestResult(
        type: _testType.text,
        time: '${_date.text} ${_time.text}',
        result: _result.text);
    await FirebaseDatabase.instance
        .ref('user/$uid/test-result')
        .update(result.toMap());

    if (imagepath != null) {
      await FirebaseStorage.instance
          .ref('user/$uid/testresult_image.png')
          .putFile(File(imagepath!));
    }
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Đã lưu'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
