import 'package:flutter/material.dart';
import './color_utils.dart';

class Exercicio4Page extends StatefulWidget {
  @override
  _Exercicio4PageState createState() => _Exercicio4PageState();
}

class _Exercicio4PageState extends State<Exercicio4Page> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();

  Color _color1 = Colors.white;
  Color _color2 = Colors.white;
  Color _color3 = Colors.white;

  _updateColors() {
    try {
      setState(() {
        _color1 = ColorUtils.fromHex(_controller1.value.text);
        _color2 = ColorUtils.fromHex(_controller2.value.text);
        _color3 = ColorUtils.fromHex(_controller3.value.text);
      });
    } catch (Exception) {
      setState(() {
        _color1 = Colors.white;
        _color2 = Colors.white;
        _color3 = Colors.white;
      });
    }
  }

  _getColorpicker(controller, color) {
    return Expanded(
      child: Container(
        color: color,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: 'Set Color'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getColorpicker(_controller1, _color1),
            _getColorpicker(_controller2, _color2),
            _getColorpicker(_controller3, _color3),
            FlatButton(
              onPressed: _updateColors,
              color: Colors.green,
              child: Text(
                'Atualizar',
                style: TextStyle(fontSize: 32),
              ),
            )
          ],
        ),
      ),
    );
  }
}
