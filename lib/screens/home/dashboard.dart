import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scanpay/models/supermaket_modal.dart';
import 'package:scanpay/screens/bottom_bar.dart';
import 'package:scanpay/screens/home/supermarket_list.dart';
import 'package:scanpay/services/database_service.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:scanpay/shared/styles.dart';

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
  DatabaseService dbService = DatabaseService();
  String productname = '';
  String productinfo = '';
  String productprice = '';
  String productCode = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //streamprovider
    return StreamProvider<List<SingleSupermarket>>.value(
      value: DatabaseService().supermarkets,
      child: Scaffold(
        appBar: AppBar(title: Text('ScanPay')),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'please product name' : null,
                        decoration:
                            inputDecoration.copyWith(labelText: 'product name'),
                        onChanged: (value) {
                          setState(() {
                            productname = value ?? '';
                          });
                        },
                      ),
                      TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'please product info' : null,
                        decoration:
                            inputDecoration.copyWith(labelText: 'Description'),
                        onChanged: (value) {
                          setState(() {
                            productinfo = value ?? '';
                          });
                        },
                      ),
                      TextFormField(
                        validator: (value) =>
                            value.isEmpty ? 'please product price' : null,
                        decoration:
                            inputDecoration.copyWith(labelText: 'Price'),
                        onChanged: (value) {
                          setState(() {
                            productprice = value ?? '';
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Scan product'),
                    
                          ElevatedButton(onPressed:scanMe, child: Icon(Icons.camera),)
                        ],
                      ),
                      // TextFormField(
                      //   validator: (value) => value.isEmpty
                      //       ? 'please product scan Barcode'
                      //       : null,
                      //   decoration:
                      //       inputDecoration.copyWith(labelText: 'barcode'),
                      //   onChanged: (value) {
                      //     setState(() {
                      //       productCode = value ?? '';
                      //     });
                      //   },
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            dbService.createRecord({
                              'productname': productname,
                              'productcode': barcode.rawContent,
                              'productinfo': productinfo,
                              'productprice': productprice,
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        },
                        child: Text('Add'),
                      )
                    ],
                  )),
            )
            // Container(
            //   height: MediaQuery.of(context).size.height / 2,
            //   child: SupermarketList(),
            // ),
            // Column(
            //   children: myText(),
            // ),
            // RaisedButton(
            //   onPressed: dbService.userData,
            //   child: Text('Add'),
            // )
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
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
