import 'package:bottender_app/utils/style/color.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static const sora = 'Sora';
  static const dmSans = 'DMSans';
}

class StandardTextStyles {

  factory StandardTextStyles() => _instance;
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
  final footnote = _StandardTextStylesModel(
    textStyle: TextStyle(
      fontSize: _StandardFontSize.footnote,
      fontFamily: AppFonts.dmSans,
    ),
  );

  static final StandardTextStyles _instance = StandardTextStyles._internal();

  StandardTextStyles._internal();
}

class _StandardFontSize {
  static double titleSize = 24;
  static double headlineSize = 20;
  static double calloutSize = 15;
  static double footnote = 10;
}

class _StandardTextStylesModel {
  late TextStyle light;
  late TextStyle medium;
  late TextStyle regular;
  late TextStyle bold;

  final TextStyle textStyle;
  final letterSpacing = -0.5;

  _StandardTextStylesModel({
    required this.textStyle,
  }) {
    light = textStyle.copyWith(
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
      letterSpacing: letterSpacing,
      color: AppThemeColor.greyShadeNegative,
    );
    medium = textStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      letterSpacing: letterSpacing,
      color: AppThemeColor.greyShadeNegative,
    );
    regular = textStyle.copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      letterSpacing: letterSpacing,
      color: AppThemeColor.greyShadeNegative,
    );
    bold = textStyle.copyWith(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      letterSpacing: letterSpacing,
      color: AppThemeColor.greyShadeNegative,
    );
  }
}
