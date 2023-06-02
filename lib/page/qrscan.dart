import 'package:electronic_health_app/models/global_user_info.dart';
import 'package:electronic_health_app/page/Home/Components/Category/category_declaration.dart';
import 'package:electronic_health_app/page/Personal/places_arrived/places_arrived.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanning extends StatefulWidget {
  const QRScanning({super.key});

  @override
  State<QRScanning> createState() => _QRScanningState();
}

class _QRScanningState extends State<QRScanning> {
  late final MobileScannerController _controller;
  bool handlingResult = false;
  String previousCodeData = '';
  @override
  void initState() {
    _controller =
        MobileScannerController(detectionSpeed: DetectionSpeed.normal);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: const Text('Quét mã QR'),
            ),
            body: Stack(children: [
              MobileScanner(
                  scanWindow: Rect.fromCenter(
                      center: Offset(MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.height / 2),
                      width: 300,
                      height: 300),
                  controller: _controller,
                  onDetect: (capture) => _handleQRCode(capture)),
              const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Text('Đặt camera trước mã để quét',
                          style:
                              TextStyle(fontSize: 30, color: Colors.white)))),
              Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.white)))
                      ]))),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                            onPressed: () {
                              _controller.toggleTorch();
                            },
                            icon: Icon(
                                size: 40,
                                _controller.torchEnabled
                                    ? Icons.flash_off_outlined
                                    : Icons.flash_on_outlined),
                            color: Colors.white),
                        const SizedBox(height: 30),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, PlacesArrivedPage.routeName);
                            },
                            child: const Text(
                              'Nơi đã đến',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ))
                      ])))
            ])));
  }

  _handleQRCode(BarcodeCapture capture) async {
    if (handlingResult) return;
    handlingResult = true;

    final Barcode barcode = capture.barcodes[0];

    String? result = verifyBarcode(barcode);
    debugPrint(' result: $result');
    result != null
        ? await _makeDeclare(result).then((value) {
            showDialog(
                context: context,
                builder: (context) {
                  return const Dialog(
                      child: Row(children: [
                    Icon(
                      Icons.done,
                      color: Colors.green,
                      size: 50,
                    ),
                    Text('Đã khai báo')
                  ]));
                }).then((value) {
              handlingResult = false;
              Navigator.pop(context);
            });
          })
        : await showQRValue(barcode).then((value) => handlingResult = false);
  }

  String? verifyBarcode(Barcode barcode) {
    if (barcode.url != null && barcode.url!.url != null) {
      Uri url = Uri.parse(barcode.url!.url!);
      if (url.host == 'electronic-health-care.com' &&
          url.pathSegments[0] == 'declaration') {
        return url.queryParameters['id'];
      }
    }
    return null;
  }

  Future<void> _makeDeclare(String id) async {
    debugPrint(' _makeDeclare b');
    bool? result = true;

    if (GlobalUserInfo.instance.declaration == null) {
      debugPrint("declaration != null");
      result = await waitForUserToDeclare();
    }
    //if User Complete Declare
    if (result != null) {
      String uid = GlobalUserInfo.instance.uid!;
      await declareToPlaceId(id, uid);
      await saveArrivedLocation(id, uid);
    }
  }

  Future<void> declareToPlaceId(String id, String uid) async {
    FirebaseDatabase.instance.ref("places/$id/peoples-arrived/$uid").set({
      'declaration': GlobalUserInfo.instance.declaration!.toMap(),
      'time': DateTime.now().toIso8601String()
    });
  }

  Future<void> saveArrivedLocation(String id, String uid) async {
    var geolocation =
        await FirebaseDatabase.instance.ref('places/$id/geolocation').get();
    DateTime now = DateTime.now();
    var date = '${now.year}-${now.month}-${now.day}';

    await FirebaseDatabase.instance
        .ref('user/$uid/places-arrived')
        .child(date)
        .child(id)
        .set({
      'time': now.toIso8601String(),
      'geolocation': geolocation.value as Map,
      'declaration': GlobalUserInfo.instance.declaration!.toMap()
    });
  }

  Future<bool?> waitForUserToDeclare() async {
    final result = await Navigator.pushNamed(
        context, CategoryDeclaration.routeName,
        arguments: 'fromScan') as bool?;
    return result;
  }

  Future<void> showQRValue(Barcode barcode) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('${barcode.displayValue ?? barcode.rawValue}'),
              actions: [
                TextButton(
                    onPressed: () => copyToClipBoard(barcode.displayValue!),
                    child: const Text('Sao chép'))
              ]);
        });
  }

  void copyToClipBoard(String data) {
    Clipboard.setData(ClipboardData(text: data)).then((value) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Đã lưu',
            style: TextStyle(color: Colors.red, fontSize: 24),
          ),
          duration: Duration(milliseconds: 1000)));
    });
  }
}
