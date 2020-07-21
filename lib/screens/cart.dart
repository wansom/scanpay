import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'dart:async';
//import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:scanpay/models/products.dart';
import 'package:scanpay/services/auth.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  ScanResult barcode;
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var myFun = <Widget>[
      if (barcode != null)
        Text(
          barcode.rawContent,
        ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('trial'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person_outline),
              label: Text('SignOut')),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Text('hello'),
          ),
          RaisedButton(
            onPressed: scanMe,
            child: Text('ScanMe'),
          ),
          Row(
            children: myFun,
          )
        ],
      )),
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
}
