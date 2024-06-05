import 'package:bottender_app/main.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:flutter/material.dart';

final _context = navigatorKey.currentContext!;

class StandardIconSize {
  late double extraSmallIcon;
  late double verySmallIcon;
  late double smallIcon;
  late double normalIcon;
  late double bigIcon;

  StandardIconSize() {
    final textScaler = MediaQuery.of(_context).textScaler;
    final maxTextScaler =
        textScaler.clamp(minScaleFactor: 1, maxScaleFactor: 1.1);

    extraSmallIcon = maxTextScaler.scale(15);
    verySmallIcon = maxTextScaler.scale(18);
    smallIcon = maxTextScaler.scale(25);
    normalIcon = maxTextScaler.scale(35);
    bigIcon = maxTextScaler.scale(50);
  }
}

class StandardBorder {
  late Radius radius;
  late BorderRadius borderRadius;
  late BorderSide side;
  late BorderSide coloredSide;
  late BorderSide primaryColoredSide;
  late RoundedRectangleBorder shape;
  late RoundedRectangleBorder coloredShape;
  late List<BoxShadow> boxShadow;

  static const double smallRadiusSize = 8;
  static const double radiusSize = 17;

  StandardBorder({bool useSmallRadiusSize = false}) {
    final currentRadiusSize = useSmallRadiusSize ? smallRadiusSize : radiusSize;

    radius = Radius.circular(currentRadiusSize);
    borderRadius = BorderRadius.circular(currentRadiusSize);
    side = const BorderSide(
      color: Colors.transparent,
      width: 0.3,
    );
    primaryColoredSide = const BorderSide(
      color: AppThemeColor.primary,
      width: 2,
    );
    coloredSide = const BorderSide(
      color: AppThemeColor.positive,
      width: 2,
    );
    shape = RoundedRectangleBorder(
      borderRadius: borderRadius,
      side: side,
    );
    coloredShape = RoundedRectangleBorder(
      borderRadius: borderRadius,
      side: coloredSide,
    );
    boxShadow = [
      BoxShadow(
        color: AppThemeColor.greyShade.withOpacity(0.1),
        spreadRadius: 0.1,
        offset: const Offset(0, -5),
        blurRadius: 5,
      ),
    ];
  }
}

class StandardSpacingSize {
  static const double small = 4;
  static const double medium = 8;
  static const double regular = 16;
}
