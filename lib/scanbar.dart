import 'dart:async';
//import 'dart:io' show Platform;

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scanpay/screens/bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScanResult scanResult;
  String barcode;

  final _flashOnController = TextEditingController(text: "Flash on");
  final _flashOffController = TextEditingController(text: "Flash off");
  final _cancelController = TextEditingController(text: "Cancel");

  var _aspectTolerance = 0.00;
  //var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  @override
  // ignore: type_annotate_public_apis
  initState() {
    super.initState();

    // Future.delayed(Duration.zero, () async {
    //   _numberOfCameras = await BarcodeScanner.numberOfCameras;
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    var rawResult = <Widget>[
      if (scanResult != null)
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            scanResult.rawContent ?? "",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      Text(barcode),
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: rawResult,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scan,
        backgroundColor: Color(0xFFFE7D6A),
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }

  Future scan() async {
    try {
      var options = ScanOptions(
        strings: {
          "cancel": _cancelController.text,
          "flash_on": _flashOnController.text,
          "flash_off": _flashOffController.text,
        },
        restrictFormat: selectedFormats,
        useCamera: _selectedCamera,
        autoEnableFlash: _autoEnableFlash,
        android: AndroidOptions(
          aspectTolerance: _aspectTolerance,
          useAutoFocus: _useAutoFocus,
        ),
      );

      var result = await BarcodeScanner.scan(options: options);

      setState(() => scanResult = result);
      print(scanResult);
    } on PlatformException catch (e) {
      var result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
      );

      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'The user did not grant the camera permission!';
        });
      } else {
        result.rawContent = 'Unknown error: $e';
      }
      setState(() {
        scanResult = result;
      });
    }
  }
}
