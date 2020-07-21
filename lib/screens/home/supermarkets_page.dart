import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Supermarkets extends StatefulWidget {
  @override
  _SupermarketsState createState() => _SupermarketsState();
}

class _SupermarketsState extends State<Supermarkets> {
  List<Widget> myData(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((document) {
      return ListTile(
        title: Text(document['supername']),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('firebase'),
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Container(
            child: StreamBuilder(
                stream:
                    Firestore.instance.collection('supermarkets').snapshots(),
                builder: (context, snapshot) {
                  return ListView(
                    children: myData(snapshot),
                  );
                }),
          )
        ],
      )),
    );
  }
}
