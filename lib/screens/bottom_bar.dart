import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Color myColor = Color(0xFF676E79);
  bool isSelected = false;
  int iscurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 9.0,
          selectedItemColor: Colors.green,
          currentIndex: iscurrentIndex,
          onTap: (index) {
            setState(() {
              iscurrentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text('home')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                title: Text('account')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket,
                ),
                title: Text('Shop')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                title: Text('settings')),
          ]),
    );
    // return BottomAppBar(
    //     shape: CircularNotchedRectangle(),
    //     notchMargin: 6.0,
    //     color: Colors.transparent,
    //     elevation: 9.0,
    //     clipBehavior: Clip.antiAlias,
    //     child: Container(
    //         height: 50.0,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(25.0),
    //                 topRight: Radius.circular(25.0)),
    //             color: Colors.white),
    //         child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Container(
    //                   height: 50.0,
    //                   width: MediaQuery.of(context).size.width / 2 - 40.0,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: <Widget>[
    //                       InkWell(
    //                         onTap: () {
    //                           setState(() {
    //                             isSelected = true;
    //                           });
    //                         },
    //                         child: Icon(
    //                           Icons.home,
    //                           color: isSelected ? Colors.green : myColor,
    //                         ),
    //                       ),
    //                       InkWell(
    //                         onTap: () async {
    //                           setState(() {
    //                             isSelected = true;
    //                           });
    //                           await _auth.signOut();
    //                         },
    //                         child: Icon(
    //                           Icons.person_outline,
    //                           color: isSelected ? Colors.green : myColor,
    //                         ),
    //                       ),
    //                     ],
    //                   )),
    //               Container(
    //                   height: 50.0,
    //                   width: MediaQuery.of(context).size.width / 2 - 40.0,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: <Widget>[
    //                       InkWell(
    //                           onTap: () {
    //                             setState(() {
    //                               isSelected = true;
    //                             });
    //                           },
    //                           child: Icon(Icons.shopping_basket,
    //                               color: isSelected ? Colors.green : myColor)),
    //                       InkWell(
    //                           onTap: () {
    //                             setState(() {
    //                               isSelected = true;
    //                             });
    //                           },
    //                           child: Icon(
    //                             Icons.settings,
    //                             color: isSelected ? Colors.green : myColor,
    //                           )),
    //                     ],
    //                   )),
    //             ])));
  }
}
