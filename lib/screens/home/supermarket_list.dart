import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanpay/models/supermaket_modal.dart';
import 'package:scanpay/screens/home/super_tile.dart';

class SupermarketList extends StatefulWidget {
  @override
  _SupermarketListState createState() => _SupermarketListState();
}

class _SupermarketListState extends State<SupermarketList> {
  @override
  Widget build(BuildContext context) {
    final supermarkets = Provider.of<List<SingleSupermarket>>(context);

    return ListView.builder(
        itemCount: supermarkets.length,
        itemBuilder: (context, index) {
          return SuperTile(superMarket: supermarkets[index]);
        });
  }
}
