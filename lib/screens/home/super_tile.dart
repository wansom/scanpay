import 'package:flutter/material.dart';
import 'package:scanpay/models/supermaket_modal.dart';

class SuperTile extends StatelessWidget {
  final SingleSupermarket superMarket;
  SuperTile({this.superMarket});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(superMarket.superName),
      trailing: Text(superMarket.stores),
    );
  }
}
