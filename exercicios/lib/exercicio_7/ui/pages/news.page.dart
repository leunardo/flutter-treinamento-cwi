import 'package:exercicios/exercicio_7/utils/ColorUtils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPageArguments {
  String url;
  String title;

  NewsPageArguments({@required this.url, @required this.title})
      : assert(url != null),
        assert(title != null);
}

class NewsPage extends StatelessWidget {
  static final String routeName = '/news';
  String url;
  String title;

  NewsPage(NewsPageArguments args) {
    url = args.url;
    title = args.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: ColorUtils.darkBlue,
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
