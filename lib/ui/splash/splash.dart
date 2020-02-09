import 'package:bancher/ui/base.dart';
import 'package:bancher/ui/home/homescreen.dart';
import 'package:bancher/ui/login/loginscreen.dart';
import 'package:bancher/ui/splash/splashViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends BasePage {
  Splash({String title: ''}) : super(title);

  @override
  _SplashState createState() => _SplashState();
}

var viewModel = SplashViewModel();

class _SplashState extends State<Splash> {
  @override
  void initState() {
    new Future.delayed(
        const Duration(seconds: 3),
        () => {
              viewModel.decideNavigation((isLoggedIn) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          isLoggedIn ? HomeScreen() : LoginScreen()),
                );
              })
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Colors.blue,
              size: 200,
            ),
            Text('Bancher',
                style: TextStyle(
                    color: Colors.blueGrey, fontFamily: 'Anton', fontSize: 30))
          ],
        ),
      ),
    );
  }
}
