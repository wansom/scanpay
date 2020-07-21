import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanpay/models/supermaket_modal.dart';
import 'package:scanpay/screens/bottom_bar.dart';
import 'package:scanpay/screens/home/supermarket_list.dart';
import 'package:scanpay/services/database_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<SingleSupermarket>>.value(
      value: DatabaseService().supermarkets,
      child: Scaffold(
        appBar: AppBar(title: Text('ScanPay')),
        body: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              child: SupermarketList(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.orange,
          child: Icon(Icons.camera),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
