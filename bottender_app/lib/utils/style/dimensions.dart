import 'package:flutter/material.dart';

class StandardIconSize {
  static const double extraSmall = 15.0;
  static const double small = 18.0;
  static const double medium = 25.0;
  static const double large = 30.0;
}

class StandardBorder {
  static const Radius radius = Radius.circular(24.0);
  static const BorderRadius borderRadius = BorderRadius.all(radius);
  static const BorderSide side = BorderSide(
    color: Colors.transparent,
    width: 1.0,
  );
  static const RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: borderRadius,
    side: side,
  );
}