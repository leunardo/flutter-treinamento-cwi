import 'package:exercicios/exercicio_8/models/breed_image.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BreedService {
  final apiUrl = 'https://dog.ceo/api';

  Future<BreedImage> search(name) async {
    var response = await http.get('$apiUrl/breed/$name/images/random');
    return _getBreedFromResponse(response);
  }

  Future<BreedImage> random() async {
    var response = await http.get('$apiUrl/breeds/image/random');
    return _getBreedFromResponse(response);
  }

  BreedImage _getBreedFromResponse(http.Response response) {
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      var breed = BreedImage.fromJson(json);
      return breed;
    }

    return null;
  }
}
