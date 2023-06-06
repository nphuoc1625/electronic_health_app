import 'dart:io';

import 'package:camera/camera.dart';
import 'package:electronic_health_app/models/global_user_info.dart';
import 'package:electronic_health_app/models/province_api.dart';
import 'package:electronic_health_app/page/Personal/personalinfo/components/avatar.dart';
import 'package:electronic_health_app/page/Personal/personalinfo/components/listpopup.dart';
import 'package:electronic_health_app/page/Personal/personalinfo/components/personalinfo_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../../../models/validator.dart';
import 'components/pickimage_menu.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _fullname = TextEditingController();
  final _date = TextEditingController();
  final _mobile = TextEditingController();
  final _id = TextEditingController();
  final _email = TextEditingController();
  final _province = TextEditingController();
  final _district = TextEditingController();
  final _ward = TextEditingController();
  final _address = TextEditingController();
  int _selectedGender = 0;

  final _formKey = GlobalKey<FormState>();
  Image? image;
  String? imagepath;
  bool imageVerified = true;

  List<Province> provinces = [];
  int? _selectedProvince;
  int? _selectedDistrict;

  void checkIfSaved() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    Info? snapshot = GlobalUserInfo.instance.info;
    if (snapshot != null) {
      var data = snapshot.toMap();
      _fullname.text = data['fullName'];
      _date.text = data['birthday'];
      _selectedGender = data['gender'];
      _id.text = data['id'];
      _mobile.text = data['mobile'];
      _email.text = data['email'];
      _province.text = data['province'];
      _district.text = data['district'];
      _ward.text = data['ward'];
      _address.text = data['address'];

      _selectedProvince =
          provinces.indexWhere((element) => element.name == _province.text);
      _selectedDistrict = provinces[_selectedProvince!]
          .districs
          .indexWhere((element) => element.name == _district.text);
    }
    FirebaseStorage.instance.ref('user/$uid/info.png').getData().then((value) {
      value != null ? image = Image.memory(value) : {};
      setState(() {});
    });
  }

  void onAddedImage(XFile file) async {
    debugPrint((file).path);

    if (!await verifyImage(InputImage.fromFilePath(file.path))) {
      imageVerified = false;
    } else {
      image = Image.memory(await file.readAsBytes(),
          width: 150, fit: BoxFit.contain);
      imagepath = file.path;
      imageVerified = true;
    }

    setState(() {});
  }

  Future<bool> verifyImage(InputImage inputImage) async {
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);

    List<Face> faces = await faceDetector.processImage(inputImage);
    faceDetector.close();

    if (faces.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Province.getAllProvinces().then((value) {
        setState(() {
          provinces = value;
        });
      });
      checkIfSaved();
    });

    super.initState();
  }

  @override
  void dispose() {
    _fullname.dispose();
    _date.dispose();
    _mobile.dispose();
    _id.dispose();
    _email.dispose();
    _province.dispose();
    _district.dispose();
    _ward.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                  child: ListView(shrinkWrap: true, children: [
                    FormField(
                        initialValue: image,
                        validator: (value) {
                          if (!imageVerified) {
                            return 'Ảnh không hợp lệ, chọn ảnh có đầy đủ khuôn mặt';
                          }
                          return null;
                        },
                        builder: (field) {
                          return Column(children: [
                            InfoAvatar(image, imageVerified),
                            if (!field.validate() || !imageVerified)
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    field.errorText!,
                                    style: const TextStyle(color: Colors.red),
                                  ))
                          ]);
                        }),
                    PickImageMenu(onAddedImage),
                    requiredText("Họ và tên"),
                    TextFormField(
                      validator: (value) => Validator.isEmpty(value),
                      controller: _fullname,
                      decoration: inputDecoration(hintText: "Họ và tên"),
                    ),
                    requiredText("Ngày sinh"),
                    TextFormField(
                      controller: _date,
                      keyboardType: TextInputType.none,
                      onTap: () {
                        showDatePicker(
                                lastDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                context: context,
                                initialDate: DateTime.now())
                            .then((value) {
                          if (value != null) {
                            _date.text = value.toString().split(' ').first;
                          }
                        });
                      },
                      decoration: PersonalInfoStyle.birthdayFormStyle,
                      validator: (value) => Validator.dateValidator(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    requiredText("Giới tính"),
                    sexSelections(),
                    requiredText("Số điện thoại"),
                    TextFormField(
                      validator: (value) => Validator.isEmpty(value),
                      controller: _mobile,
                      keyboardType: TextInputType.phone,
                      decoration: inputDecoration(hintText: ""),
                    ),
                    requiredText("Số hộ chiếu/CMND/CCCD"),
                    TextFormField(
                      validator: (value) => Validator.isEmpty(value),
                      controller: _id,
                      keyboardType: TextInputType.phone,
                      decoration: inputDecoration(),
                    ),
                    requiredText("Email"),
                    TextFormField(
                      validator: (value) => Validator.validateEmail(value),
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputDecoration(hintText: "vidu@gmail.com"),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                    ),
                    requiredText("Tỉnh/Thành phố"),
                    TextFormField(
                      onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => ChooseFromList(provinces))
                          .then((value) {
                        _selectedProvince = value[1];
                        _province.text = value[0];
                      }),
                      keyboardType: TextInputType.none,
                      validator: (value) => Validator.isEmpty(value),
                      controller: _province,
                      decoration: inputDecoration(
                          icon: const Icon(Icons.arrow_drop_down)),
                    ),
                    requiredText("Quận/Huyện"),
                    TextFormField(
                      onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => ChooseFromList(
                                  provinces[_selectedProvince!].districs))
                          .then((value) {
                        _selectedDistrict = value[1];
                        _district.text = value[0];
                      }),
                      keyboardType: TextInputType.none,
                      validator: (value) => Validator.isEmpty(value),
                      controller: _district,
                      decoration: inputDecoration(
                          icon: const Icon(Icons.arrow_drop_down)),
                    ),
                    requiredText("Phường/Xã"),
                    TextFormField(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            List list = provinces[_selectedProvince!]
                                .districs[_selectedDistrict!]
                                .wards;
                            return ChooseFromList(list);
                          }).then((value) {
                        _ward.text = value[0];
                      }),
                      keyboardType: TextInputType.none,
                      validator: (value) => Validator.isEmpty(value),
                      controller: _ward,
                      decoration: inputDecoration(
                          icon: const Icon(Icons.arrow_drop_down)),
                    ),
                    requiredText("Thôn/Xóm/Số nhà"),
                    TextFormField(
                        validator: (value) => Validator.isEmpty(value),
                        controller: _address,
                        decoration: inputDecoration())
                  ]))),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue[900]),
                      minimumSize:
                          const MaterialStatePropertyAll(Size.fromHeight(50)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      save();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text(
                              'Thông tin không hợp lệ,vui lòng kiểm tra lại')));
                    }
                  },
                  child: const Text("Lưu thông tin",
                      style: TextStyle(fontSize: 18))))
        ]));
  }

  Widget sexSelections() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(3, (index) {
          return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Radio(
                value: index,
                groupValue: _selectedGender,
                onChanged: (value) {
                  _selectedGender = value!;
                  setState(() {});
                }),
            Text(['Nữ', 'Nam', 'Khác'][index])
          ]);
        }));
  }

  InputDecoration inputDecoration({String? hintText, Icon? icon}) {
    return InputDecoration(
      hintText: hintText,
      suffixIcon: icon,
      iconColor: Colors.blue,
      contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget requiredText(String value) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 14, 0, 8),
        child: Row(children: [
          Text(value, style: const TextStyle(fontSize: 18)),
          const Text(" *", style: TextStyle(color: Colors.red, fontSize: 20))
        ]));
  }

  save() {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref('user/$uid/info');
    ref.update({
      'fullName': _fullname.text,
      'birthday': _date.text,
      'gender': _selectedGender,
      'mobile': _mobile.text,
      'id': _id.text,
      'email': _email.text,
      'province': _province.text,
      'district': _district.text,
      'ward': _ward.text,
      'address': _address.text,
    }).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('Lưu thành công')));
    });
    if (image != null && imagepath != null) {
      FirebaseStorage.instance
          .ref('user/$uid/info.png')
          .putFile(File(imagepath!));
    }
  }
}
