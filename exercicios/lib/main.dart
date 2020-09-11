import 'package:exercicios/exercicio_1/exercicio1.page.dart';
import 'package:exercicios/exercicio_2/exercicio2.page.dart';
import 'package:exercicios/exercicio_3/exercicio3.page.dart';
import 'package:exercicios/exercicio_4/exercicio4.page.dart';
import 'package:exercicios/exercicio_5/routes.dart';
import 'package:exercicios/exercicio_6/calc.page.dart';
import 'package:exercicios/exercicio_8/ui/pages/exercicio_9.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var useRouting = false;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: useRouting ? Routing.routes : {},
      initialRoute: useRouting ? Exercicio3Page.routeName : null,
      home: useRouting ? null : Exercicio9Page(),
    );
  }
}
