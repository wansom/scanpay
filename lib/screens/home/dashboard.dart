import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scanpay/models/products.dart';
import 'package:scanpay/models/supermaket_modal.dart';
import 'package:scanpay/screens/bottom_bar.dart';
import 'package:scanpay/screens/home/supermarket_list.dart';
import 'package:scanpay/services/database_service.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myPages = [
    HomePage(),
    SupermarketList(),
  ];
  ScanResult barcode;
  @override
  Widget build(BuildContext context) {
    //streamprovider
    return StreamProvider<List<SingleSupermarket>>.value(
      value: DatabaseService().supermarkets,
      child: Scaffold(
        appBar: AppBar(title: Text('ScanPay')),
        body: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: SupermarketList(),
            ),
            Column(
              children: myText(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: scanMe,
          backgroundColor: Colors.orange,
          child: Icon(Icons.camera),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(),
      ),
    );
  }

  Future scanMe() async {
    try {
      ScanResult result = await BarcodeScanner.scan();
      setState(() {
        barcode = result;
      });

      myProducts.add(Products(
          productName: barcode.rawContent, productInfo: 'very sweet bananas'));

      Navigator.pushNamed(context, '/checkout',
          arguments: {'barcode': barcode.rawContent});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  List<Widget> myText() {
    if (barcode != null && barcode.rawContent == myProducts[0].barCode) {
      return [
        Container(height: 50.0, child: Text(barcode.rawContent)),
        Container(height: 50.0, child: Text(myProducts[0].productName)),
      ];
    } else {
      return [Text('No results detected')];
    }
  }
}
