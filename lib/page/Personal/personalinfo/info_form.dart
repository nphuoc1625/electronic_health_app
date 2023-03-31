import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  int _selectedRadioValue = 1;
  void _onRadioSelected(int? selectedValue) {
    setState(() {
      _selectedRadioValue = selectedValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      children: [
        UnconstrainedBox(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      border: Border.all(color: Colors.blue, width: 3)),
                  child: const Icon(
                    size: 100,
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
              )),
        ),
        requiredText("Họ và tên"),
        TextFormField(
          decoration: inputDecoration(hintText: "Họ và tên"),
        ),
        requiredText("Ngày tháng năm sinh"),
        TextFormField(
          decoration: inputDecoration(
              icon: const Icon(Icons.calendar_month), hintText: "2000-01-01"),
        ),
        requiredText("Giới tính"),
        sexSelections(),
        requiredText("Số điện thoại"),
        TextField(
          decoration: inputDecoration(hintText: ""),
        ),
        requiredText("Số hộ chiếu/CMND/CCCD"),
        TextField(
          decoration: inputDecoration(),
        ),
        requiredText("Email"),
        TextField(
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
        TextField(
          decoration: inputDecoration(icon: const Icon(Icons.arrow_drop_down)),
        ),
        requiredText("Quận/Huyện"),
        TextField(
          decoration: inputDecoration(icon: const Icon(Icons.arrow_drop_down)),
        ),
        requiredText("Phường/Xã"),
        TextField(
          decoration: inputDecoration(icon: const Icon(Icons.arrow_drop_down)),
        ),
        requiredText("Thôn/Xóm/Số nhà"),
        TextField(
          decoration: inputDecoration(),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue[900]),
                  minimumSize:
                      const MaterialStatePropertyAll(Size.fromHeight(50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)))),
              onPressed: () {},
              child: const Text(
                "Lưu thông tin",
                style: TextStyle(fontSize: 18),
              )),
        )
      ],
    ));
  }

  Widget sexSelections() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: 1,
              groupValue: _selectedRadioValue,
              onChanged: _onRadioSelected,
            ),
            const Text('Nam'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: 0,
              groupValue: _selectedRadioValue,
              onChanged: _onRadioSelected,
            ),
            const Text('Nữ '),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: 2,
              groupValue: _selectedRadioValue,
              onChanged: _onRadioSelected,
            ),
            const Text('Khác'),
          ],
        ),
      ],
    );
  }

  InputDecoration inputDecoration({String? hintText, Icon? icon}) {
    return InputDecoration(
        hintText: hintText,
        suffixIcon: icon,
        iconColor: Colors.blue,
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)));
  }

  Widget requiredText(String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 8),
      child: Row(children: [
        Text(value, style: const TextStyle(fontSize: 18)),
        const Text(" *", style: TextStyle(color: Colors.red, fontSize: 20))
      ]),
    );
  }
}
