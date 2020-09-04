import 'package:flutter/material.dart';

class Exercicio1Page extends StatelessWidget {
  Widget _generateSquare(Color color) {
    return Expanded(
        flex: 1,
        child: Container(
          color: color,
          height: double.infinity,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  _generateSquare(Colors.purple[100]),
                  _generateSquare(Colors.purple[200]),
                  _generateSquare(Colors.purple[300]),
                ],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  _generateSquare(Colors.red[100]),
                  _generateSquare(Colors.red[200]),
                  _generateSquare(Colors.red[300]),
                ],
              )),
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  _generateSquare(Colors.green[100]),
                  _generateSquare(Colors.green[200]),
                  _generateSquare(Colors.green[300]),
                ],
              )),
        ],
      ),
    );
  }
}
