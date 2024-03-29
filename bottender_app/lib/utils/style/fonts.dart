import 'package:bottender_app/utils/style/color.dart';
import 'package:flutter/material.dart';


class AppFonts {
  static const sora = 'Sora';
  static const dmSans = 'DMSans';
}

class StandardTextStyles {
  final title = _StandardTextStylesModel(
    textStyle: TextStyle(
      fontSize: _StandardFontSize.titleSize,
      fontFamily: AppFonts.sora,
    ),
  );
  final headline = _StandardTextStylesModel(
    textStyle: TextStyle(
      fontSize: _StandardFontSize.headlineSize,
      fontFamily: AppFonts.dmSans,
    ),
  );
  final callout = _StandardTextStylesModel(
    textStyle: TextStyle(
      fontSize: _StandardFontSize.calloutSize,
      fontFamily: AppFonts.dmSans,
    ),
  );

  static final StandardTextStyles _instance = StandardTextStyles._internal();

  StandardTextStyles._internal();

  factory StandardTextStyles() => _instance; 
}

class _StandardFontSize {
  static double titleSize = 24;
  static double headlineSize = 20;
  static double calloutSize = 15;
}

class _StandardTextStylesModel {
  late TextStyle light;
  late TextStyle medium;
  late TextStyle regular;

  final TextStyle textStyle;
  final letterSpacing = -0.5;

  _StandardTextStylesModel({
    required this.textStyle,
  }) {
    light = textStyle.copyWith(
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
      letterSpacing: letterSpacing,
      color: AppThemeColor.negative,
    );
    medium = textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: letterSpacing,
      color: AppThemeColor.negative,
    );
    regular = textStyle.copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      letterSpacing: letterSpacing,
      color: AppThemeColor.negative,
    );
  }
}