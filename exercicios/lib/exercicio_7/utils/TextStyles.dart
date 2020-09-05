import 'package:flutter/material.dart';

class TextStyles {
  static const Heading = TextStyle(fontSize: 24, color: Colors.white);

  static const Bold = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 1, offset: Offset(1, 1))
      ]);

  static const Normal = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 1, offset: Offset(1, 1))
      ]);

  static const Tag =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);
}
