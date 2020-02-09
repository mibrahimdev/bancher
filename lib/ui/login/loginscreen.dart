import 'package:bancher/ui/base.dart';
import 'package:bancher/ui/home/homescreen.dart';
import 'package:bancher/ui/login/loginviewModel.dart';
import 'package:bancher/ui/register/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  String _title;
  LoginScreen({String title: 'Login'}) {
    this._title = title;
  }

  String getTitle() {
    return _title;
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

var viewmodel = LoginViewModel();
var email = '';
var pasw = '';

class _LoginScreenState extends State<LoginScreen> {
  final appLogo = Icon(
    Icons.location_searching,
    size: 90,
    color: Colors.blueAccent,
  );

  @override
  Widget build(BuildContext context) {
    return scaffold(
        widget.getTitle(),
        Container(
          child: Scaffold(
            body: Center(
              child: Container(
                padding: EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    appLogo,
                    emailInput,
                    passwordInput,
                    loginButton(() {
                      viewmodel.login(email, pasw, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }, (message) {
                        Toast.show(message, context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      });
                    }),
                    signupHintText(context)
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  static final textStyle = TextStyle(
    fontFamily: 'Anton',
    fontSize: 20,
  );

  final emailInput = TextField(
    onChanged: (text) => {email = text},
    decoration: InputDecoration(hintText: 'Email'),
    keyboardType: TextInputType.emailAddress,
    style: textStyle,
  );

  final passwordInput = TextField(
      onChanged: (text) => {pasw = text},
      decoration: InputDecoration(hintText: 'Password'),
      obscureText: true,
      style: textStyle);

  Widget loginButton(Function onPressed) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: FlatButton(
          onPressed: onPressed,
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget signupHintText(BuildContext context) {
    return RichText(
        text: new TextSpan(children: [
      TextSpan(
        text: 'New company to Bancher? ',
        style: TextStyle(color: Colors.black),
      ),
      TextSpan(
          text: 'sign up!',
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
          recognizer: new TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            })
    ]));
  }
}
