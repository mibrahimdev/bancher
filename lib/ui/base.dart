import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  String _title;
  BasePage(String title) {
    _title = title;
  }

  String getTitle() {
    return _title;
  }
}

Widget scaffold(String title, Widget body) {
  return Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Text(title),
    ),
    body: body,
  );
}
