import 'package:flutter/material.dart';
import 'package:scanpay/services/auth.dart';
import 'package:scanpay/shared/loading.dart';

class SignupPage extends StatefulWidget {
  final Function toggleView;
  SignupPage({this.toggleView});
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : new Scaffold(
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 115.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? 'field is required' : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? 'field is required' : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'PASSWORD ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                        ),
                        SizedBox(height: 50.0),
                        Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: Colors.orange,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() {
                                        error = 'Enter a valid email';
                                      });
                                    }
                                  } else {}
                                },
                                child: Center(
                                  child: Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Container(
                          height: 40.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(  
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: InkWell(
                                onTap: () {
                                  widget.toggleView();
                                },
                                child: Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 5.0),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       'New to Spotify?',
              //       style: TextStyle(
              //         fontFamily: 'Montserrat',
              //       ),
              //     ),
              //     SizedBox(width: 5.0),
              //     InkWell(
              //       child: Text('Register',
              //           style: TextStyle(
              //               color: Colors.green,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.bold,
              //               decoration: TextDecoration.underline)),
              //     )
              //   ],
              // )
            ]));
  }
}
