import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanpay/app.dart';
import 'package:scanpay/models/user.dart';

import 'package:scanpay/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
