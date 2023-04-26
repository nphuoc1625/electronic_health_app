import 'package:electronic_health_app/page/Home/Components/Category/TestResult/validator.dart';
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

  var addedImages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _testType.dispose();
    _time.dispose();
    _date.dispose();
    _result.dispose();
    super.dispose();
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
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Loại xét nghiệm",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  )
                ],
              ),
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.blue,
              ),
            ),
            validator: (value) => Validator.simpleValidator(value),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _time,
                  validator: (value) => Validator.simpleValidator(value),
                  keyboardType: TextInputType.none,
                  onTap: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then(
                      (value) {
                        if (value != null) {
                          _time.text = "${value.hour}:${value.minute}";
                        }
                      },
                    );
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Giờ lấy mẫu"),
                    suffixIcon: Icon(
                      Icons.watch_later_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: _date,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Row(
                      children: const [
                        Text("Ngày lấy mẫu"),
                        Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    suffixIcon: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.blue,
                    ),
                  ),
                  validator: (value) => Validator.simpleValidator(value),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _result,
            onTap: () {},
            validator: (value) => Validator.simpleValidator(value),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Row(
                children: const [
                  Text("Kết quả"),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Minh chứng kết quả xét nghiệm ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          const Text("Có thể là giấy chứng nhận hoặc ảnh chụp kit test nhanh"),
          const SizedBox(height: 20),
          Visibility(
            visible: false,
            child: SizedBox(
              height: 70,
              child: FormField<Image>(
                validator: (value) => Validator.imageValidator(value),
                builder: (field) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => addedImages[index],
                    itemCount: addedImages.length,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Column(
                    children: const [Icon(Icons.camera_alt), Text("Chụp ảnh")],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: VerticalDivider(
                        width: 20, thickness: 1, color: Colors.grey)),
                TextButton(
                  onPressed: () {},
                  child: Column(
                    children: const [Icon(Icons.camera_alt), Text("Thư viện")],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(250, 50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  backgroundColor: const MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                setState(() {
                  addedImages.add(const Icon(Icons.image));
                });
                if (!_formKey.currentState!.validate()) {
                } else {
                  //Update data
                }
              },
              child: const Text("Lưu thông tin"),
            ),
          ),
        ],
      ),
    );
  }
}
