import 'package:flutter/material.dart';

double getTextHeight({String? text,required TextStyle style}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(
      text: text ?? "Text",
      style: style,
    ),
    textDirection: TextDirection.ltr,
  )..layout();
  return textPainter.height;
}