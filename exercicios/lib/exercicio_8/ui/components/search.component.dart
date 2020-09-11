import 'package:exercicios/exercicio_8/network/breed.service.dart';
import 'package:exercicios/exercicio_8/utils/debouncer.dart';
import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  TextEditingController _controller = TextEditingController();
  Debouncer _debouncer = Debouncer(milliseconds: 500);
  BreedService _service = BreedService();
  String _image;
  String _lastBreed;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      var name = _controller.value.text;

      if (_lastBreed == name) return;

      _debouncer.run(() => _updateImage(name));
    });
  }

  _updateImage(name) async {
    var breed = await _service.search(name);

    if (breed != null) {
      setState(() {
        _image = breed.message;
        _lastBreed = name;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Type the breed you want to see:'),
              TextFormField(controller: _controller),
              _image != null ? Image.network(_image) : Container(),
              _image != null
                  ? FlatButton(
                      child: Text('Another one!'),
                      onPressed: () => _updateImage(_lastBreed),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
