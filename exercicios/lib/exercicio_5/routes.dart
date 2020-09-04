import 'package:exercicios/exercicio_3/exercicio3.page.dart';
import 'package:exercicios/exercicio_5/home.page.dart';
import 'package:exercicios/exercicio_5/login.page.dart';
import 'package:exercicios/exercicio_5/verification.page.dart';
import 'package:flutter/material.dart';

class Routing {
  static final Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (context) =>
        HomePage(ModalRoute.of(context).settings.arguments),
    LoginPage.routeName: (context) => LoginPage(),
    VerificationPage.routeName: (context) => VerificationPage(),
    // Exercicio 3 = /register
    Exercicio3Page.routeName: (context) => Exercicio3Page()
  };
}
