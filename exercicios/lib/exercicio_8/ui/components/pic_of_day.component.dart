import 'package:exercicios/exercicio_8/network/breed.service.dart';
import 'package:flutter/material.dart';

class PicOfDayComponent extends StatefulWidget {
  @override
  _PicOfDayComponentState createState() => _PicOfDayComponentState();
}

class _PicOfDayComponentState extends State<PicOfDayComponent> {
  BreedService _service = BreedService();
  String _image;

  @override
  void initState() {
    super.initState();

    _service.random().then((value) {
      setState(() {
        _image = value.message;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _image != null ? Image.network(_image) : null,
      ),
    );
  }
}
