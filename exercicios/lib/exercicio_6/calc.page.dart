import 'dart:math';

import 'package:exercicios/exercicio_6/color_utils.dart';
import 'package:flutter/material.dart';

class CalcPage extends StatefulWidget {
  @override
  _CalcPageState createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  List<String> _operations = [];
  double _result = null;

  _printOperations() {
    if (_result != null) {
      return _result.toString();
    }

    return _operations.join(' ');
  }

  _isNumber(String value) {
    return double.tryParse(value) != null;
  }

  _addNumber(String number) {
    setState(() {
      _result = null;
      if (_operations.isNotEmpty &&
          (_isNumber(_operations.last) || _operations.last == '.')) {
        _operations.last += number;
      } else {
        _operations.add(number);
      }
    });
  }

  _addOperation(String operation) {
    if (_operations.isEmpty) {
      return;
    }

    setState(() {
      _result = null;
      if (_isNumber(_operations.last)) {
        _operations.add(operation);
      } else {
        _operations.last = operation;
      }
    });
  }

  _clear() {
    setState(() {
      _operations = [];
      _result = null;
    });
  }

  _calculate() {
    if (_operations.isEmpty || !_isNumber(_operations.last)) {
      return;
    }

    double result = 0;

    do {
      var indexMultiply = _getIndexOf('*');
      var indexDivide = _getIndexOf('/');

      if (indexMultiply != null || indexDivide != null) {
        result +=
            _calculateMultiplyDivideOperations(indexMultiply, indexDivide);
      } else {
        result += _calculatePlusMinusOperations();
      }
    } while (_operations.isNotEmpty);

    setState(() {
      _operations.add(result.toString());
      _result = result;
    });
  }

  double _calculatePlusMinusOperations() {
    double result;

    if (!_isNumber(_operations[0])) {
      _operations.insert(0, '0');
    }
    if (_operations.length == 2) {
      _operations.add('0');
    }

    var operator = _operations[1];
    if (operator == '+') {
      result = double.parse(_operations[0]) + double.parse(_operations[2]);
    } else {
      result = double.parse(_operations[0]) - double.parse(_operations[2]);
    }

    _operations.removeRange(0, 3);
    return result;
  }

  double _calculateMultiplyDivideOperations(
      int indexMultiply, int indexDivide) {
    // checamos se o valor eh nulo, caso for setamos com o valor oposto
    // porque a funcao min() nao aceita null
    indexMultiply = indexMultiply == null ? indexDivide : indexMultiply;
    indexDivide = indexDivide == null ? indexMultiply : indexDivide;

    var nextOperation = min(indexMultiply, indexDivide);
    double result = 0;
    if (_operations[nextOperation] == '*') {
      result = double.parse(_operations[nextOperation - 1]) *
          double.parse(_operations[nextOperation + 1]);
    } else {
      result = double.parse(_operations[nextOperation - 1]) /
          double.parse(_operations[nextOperation + 1]);
    }

    // start eh inclusivo, end eh exclusivo entao adicionamos + 2
    _operations.removeRange(nextOperation - 1, nextOperation + 2);
    return result;
  }

  int _getIndexOf(String operation) {
    var index = _operations.indexOf(operation);
    return index == -1 ? null : index;
  }

  _getButton(label, color, textColor, onPressed,
      {ShapeBorder shape: const CircleBorder()}) {
    return FlatButton(
        onPressed: onPressed,
        color: color,
        child: Text(
          label,
          style: TextStyle(fontSize: 32, color: textColor),
        ),
        padding: EdgeInsets.all(25),
        shape: shape);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorUtils.darkGrey,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            _printOperations(),
            style:
                TextStyle(color: Colors.white, decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getButton('C', ColorUtils.lightGrey, ColorUtils.grey2, _clear),
              _getButton('+/-', ColorUtils.lightGrey, ColorUtils.grey2, () {}),
              _getButton('%', ColorUtils.lightGrey, ColorUtils.grey2, () {}),
              _getButton('/', ColorUtils.orange, Colors.white,
                  () => _addOperation('/')),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getButton(
                  '7', ColorUtils.grey, Colors.white, () => _addNumber('7')),
              _getButton(
                  '8', ColorUtils.grey, Colors.white, () => _addNumber('8')),
              _getButton(
                  '9', ColorUtils.grey, Colors.white, () => _addNumber('9')),
              _getButton('*', ColorUtils.orange, Colors.white,
                  () => _addOperation('*')),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getButton(
                  '4', ColorUtils.grey, Colors.white, () => _addNumber('4')),
              _getButton(
                  '5', ColorUtils.grey, Colors.white, () => _addNumber('5')),
              _getButton(
                  '6', ColorUtils.grey, Colors.white, () => _addNumber('6')),
              _getButton('-', ColorUtils.orange, Colors.white,
                  () => _addOperation('-')),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getButton(
                  '1', ColorUtils.grey, Colors.white, () => _addNumber('1')),
              _getButton(
                  '2', ColorUtils.grey, Colors.white, () => _addNumber('2')),
              _getButton(
                  '3', ColorUtils.grey, Colors.white, () => _addNumber('3')),
              _getButton('+', ColorUtils.orange, Colors.white,
                  () => _addOperation('+')),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: _getButton(
                      '0', ColorUtils.grey, Colors.white, () => _addNumber('0'),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100)))),
                  flex: 2),
              Expanded(
                  child: _getButton('.', ColorUtils.grey, Colors.white,
                      () => _addNumber('.')),
                  flex: 1),
              Expanded(
                  child: _getButton(
                      '=', ColorUtils.orange, Colors.white, _calculate),
                  flex: 1),
            ],
          ),
        ],
      ),
    );
  }
}
