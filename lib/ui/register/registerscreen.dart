import 'package:bancher/data/entities.dart';
import 'package:bancher/ui/home/homescreen.dart';
import 'package:bancher/ui/register/registerviewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../base.dart';

class RegisterScreen extends BasePage {
  RegisterScreen({String title: 'Register'}) : super(title);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

RegisterViewModel viewModel = RegisterViewModel();

enum RegisterOprions { USER, DRIVER }
var selectedRegisterOption = RegisterOprions.USER;

class _RegisterScreenState extends State<RegisterScreen> {
  var email = '';
  var name = '';
  var pass = '';
  var repeatedPass = '';
  var isDriver = false;

  Function showSuccessMessage({String message: 'Success'}) {
    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  Function showErrorMessage(String message) {
    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(widget.getTitle()),
        ),
        body: Container(
          child: Scaffold(
            body: Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    nameInput((txt) {
                      name = txt;
                    }),
                    emailInput((txt) {
                      email = txt;
                    }),
                    passwordInput((txt) {
                      pass = txt;
                    }),
                    repatedPasswordInput((txt) {
                      repeatedPass = txt;
                    }),
                    registerationOptions((RegisterOprions value) {
                      setState(() {
                        selectedRegisterOption = value;
                        isDriver =
                            selectedRegisterOption == RegisterOprions.DRIVER;
                      });
                    }),
                    registerButton(() {
                      viewModel.signup(
                          User(email, name, pass, isDriver), repeatedPass, () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }, (errMessage) {
                        showErrorMessage(errMessage);
                      });
                    }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Column registerationOptions(Function onChanged) {
    return Column(
      children: <Widget>[
        RadioListTile<RegisterOprions>(
          title: const Text('Register as a User'),
          value: RegisterOprions.USER,
          groupValue: selectedRegisterOption,
          onChanged: onChanged,
        ),
        RadioListTile<RegisterOprions>(
          title: const Text('Register as a service viechle'),
          value: RegisterOprions.DRIVER,
          groupValue: selectedRegisterOption,
          onChanged: (RegisterOprions value) {
            setState(() {
              selectedRegisterOption = value;
            });
          },
        ),
      ],
    );
  }

  static final textStyle = TextStyle(
    fontFamily: 'Anton',
    fontSize: 20,
  );

  Widget nameInput(Function onChanged) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(hintText: 'Name'),
      keyboardType: TextInputType.text,
      style: textStyle,
    );
  }

  Widget emailInput(Function onChanged) {
    return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        style: textStyle);
  }

  Widget passwordInput(Function onChanged) {
    return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(hintText: 'Password'),
        keyboardType: TextInputType.text,
        obscureText: true,
        style: textStyle);
  }

  Widget repatedPasswordInput(Function onChanged) {
    return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(hintText: 'Password'),
        keyboardType: TextInputType.text,
        obscureText: true,
        style: textStyle);
  }

  Widget registerButton(Function pressed) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: FlatButton(
          onPressed: pressed,
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
