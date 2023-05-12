import 'dart:convert';
import 'dart:io';

import 'package:electronic_health_app/models/testresult.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/components/pickimage_menu.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/components/style.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/components/testresult_menu.dart';
import 'package:electronic_health_app/page/Home/Components/Category/TestResult/components/testtype_menu.dart';
import 'package:electronic_health_app/model/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //Check if User had data
      getData();
    });
    super.initState();
  }

  getData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DataSnapshot value =
        await FirebaseDatabase.instance.ref('user/$uid/test-result').get();
    if (value.value != null) {
      TestResult data = TestResult.fromMap(value.value as Map);
      _testType.text = data.type;
      _result.text = data.result;
      _date.text = data.date;
      _time.text = data.time;

      var imageData = await FirebaseStorage.instance
          .ref('user/$uid/testresult_image.png')
          .getData();
      addedImages = Image.memory(imageData!);
      setState(() {});
    }
  }

  @override
  void dispose() {
    _testType.dispose();
    _time.dispose();
    _date.dispose();
    _result.dispose();
    super.dispose();
  }

  void save() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    TestResult result = TestResult(_testType.text, time, _result.text);
    FirebaseDatabase.instance
        .ref('user/$uid/test-result')
        .update(result.toMap());

    FirebaseStorage.instance
        .ref('user/$uid/testresult_image.png')
        .putFile(File(imagepath!));
  }

  void onAddedImage(Image image, String path) {
    addedImages = image;
    imagepath = path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            textAlign: TextAlign.center,
            "Thông tin xét nghiệm ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      constraints: const BoxConstraints(maxHeight: 200))
                  .then((value) => value != null
                      ? _testType.text = value
                      : _testType.text = '');
            },
            decoration: TestResultStyles.typeFormDecoration,
            validator: (value) => Validator.Empty(value),
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
                            context: context, initialTime: TimeOfDay.now())
                        .then(
                      (value) {
                        if (value != null) {
                          time.copyWith(
                            hour: value.hour,
                            minute: value.minute,
                          );
                          _time.text = "${value.hour}:${value.minute}";
                        }
                      },
                    );
                  },
                  validator: (value) => Validator.Empty(value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  validator: (value) => Validator.dateValidator(value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
              ).then((value) => value != null ? {_result.text = value} : {});
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => Validator.Empty(value),
            decoration: TestResultStyles.resultFormDecoration,
          ),
          const Text(
            "Minh chứng kết quả xét nghiệm ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          const Text("Có thể là giấy chứng nhận hoặc ảnh chụp kit test nhanh"),
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
                      ? Stack(alignment: Alignment.topCenter, children: [
                          addedImages!,
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    addedImages = null;
                                  });
                                },
                                icon: const Icon(
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
                addedImages == null ? 'Thiếu ảnh minh  ' : null,
          ),
          PickImageMenu(onAddedImage),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(250, 50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  backgroundColor: const MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                if (_formKey.currentState!.validate()) save();
              },
              child: const Text("Lưu thông tin"),
            ),
          ),
        ],
      ),
    );
  }
}
