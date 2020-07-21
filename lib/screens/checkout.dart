import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  Map scanBar = {};

  @override
  Widget build(BuildContext context) {
    scanBar = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(scanBar['barcode']),
      ),
    );
  }
}
