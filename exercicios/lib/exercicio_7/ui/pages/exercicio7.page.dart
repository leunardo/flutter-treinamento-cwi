import 'dart:convert';
import 'dart:io';

import 'package:exercicios/exercicio_7/ui/components/card.component.dart';
import 'package:exercicios/exercicio_7/models/news.dart';
import 'package:exercicios/exercicio_7/utils/ColorUtils.dart';
import 'package:exercicios/exercicio_7/utils/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercicio7Page extends StatefulWidget {
  static final String routeName = '/exercicio7';

  @override
  _Exercicio7PageState createState() => _Exercicio7PageState();
}

class _Exercicio7PageState extends State<Exercicio7Page> {
  List<CardComponent> news = [];

  @override
  void initState() {
    super.initState();

    _getData();
  }

  _getData() async {
    var json = await DefaultAssetBundle.of(context)
        .loadString('assets/exercicio_7/data/feed_data.json');
    var data = JsonDecoder().convert(json);

    List<CardComponent> result = data['news']
        .map<News>((n) => News.fromJson(n))
        .map<CardComponent>((e) => CardComponent(news: e))
        .toList();

    setState(() {
      news = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News', style: TextStyles.Heading),
        backgroundColor: ColorUtils.darkBlue,
      ),
      body: Container(
        color: ColorUtils.blue,
        child: SingleChildScrollView(
          child: Column(
            children: news,
          ),
        ),
      ),
    );
  }
}
