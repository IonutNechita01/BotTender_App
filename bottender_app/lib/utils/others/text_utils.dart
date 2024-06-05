import 'package:flutter/material.dart';

double getTextHeight({required TextStyle style, String? text}) {
  final textPainter = TextPainter(
    text: TextSpan(
      text: text ?? 'Text',
      style: style,
    ),
    textDirection: TextDirection.ltr,
  )..layout();
  return textPainter.height;
}
