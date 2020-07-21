import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanpay/models/user.dart';
import 'package:scanpay/screens/auth/authenticate.dart';
import 'package:scanpay/screens/home/dashboard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
