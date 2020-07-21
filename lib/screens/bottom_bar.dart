import 'package:flutter/material.dart';
import 'package:scanpay/services/auth.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  AuthService _auth = AuthService();
  Color myColor = Color(0xFF676E79);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Icon(
                              Icons.home,
                              color: Colors.orange,
                            ),
                          ),
                          InkWell(
                              onTap: () async {
                                await _auth.signOut();
                              },
                              child:
                                  Icon(Icons.person_outline, color: myColor)),
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                              onTap: () {},
                              child:
                                  Icon(Icons.shopping_basket, color: myColor)),
                          InkWell(
                              onTap: () {},
                              child: Icon(Icons.settings, color: myColor)),
                        ],
                      )),
                ])));
  }
}
