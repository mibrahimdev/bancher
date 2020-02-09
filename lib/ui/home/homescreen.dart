import 'package:bancher/data/entities.dart';
import 'package:bancher/ui/base.dart';
import 'package:bancher/ui/home/homeViewModel.dart';
import 'package:bancher/ui/login/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var viewModel = HomeViewModel();
String username = '';

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    viewModel.showUserInfo((User info) => {username = info.getName()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: scaffold(
          'Home',
          Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(username.isNotEmpty ? 'Hello $username' : 'Oops.. there should be your name here',
                    style: TextStyle(fontSize: 30),
                  ),
                  FlatButton(
                    onPressed: () {
                      viewModel.logout(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      });
                    },
                    color: Colors.redAccent,
                    child: Text('logout'),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
