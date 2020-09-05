import 'package:exercicios/exercicio_7/models/news.dart';
import 'package:exercicios/exercicio_7/ui/pages/news.page.dart';
import 'package:exercicios/exercicio_7/utils/ColorUtils.dart';
import 'package:exercicios/exercicio_7/utils/TextStyles.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final News news;
  CardComponent({this.news}) : assert(news != null);

  _onTap(BuildContext context) {
    Navigator.pushNamed(context, '/news',
        arguments: NewsPageArguments(title: news.title, url: news.url));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => _onTap(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                news.image != 'None'
                    ? Image.network(news.image)
                    : Container(
                        height: 200,
                        width: double.infinity,
                        color: ColorUtils.grey),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 130,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorUtils.lightBlue,
                    ),
                    child: Text(
                      news.category[0].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyles.Tag,
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: ColorUtils.grey,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(news.title, style: TextStyles.Bold),
                  SizedBox(
                    height: 10,
                  ),
                  Text(news.description, style: TextStyles.Normal),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
