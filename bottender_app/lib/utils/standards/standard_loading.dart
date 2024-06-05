import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StandardLoading extends StatelessWidget {
  final String? text;

  const StandardLoading({this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? 'Loading...',
            style: StandardTextStyles().callout.regular,
          ),
          StandardSpacing.medium(),
          const SpinKitFadingCircle(
            color: AppThemeColor.primary,
          ),
        ],
      ),
    );
  }
}
