import 'package:flutter/material.dart';

class HomePageArguments {
  String email;

  HomePageArguments({this.email});
}

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  HomePageArguments args;
  HomePage(this.args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text('Home'),
        ),
        body: Container(
          child: Text('Hello, ${args.email}'),
        ));
  }
}
