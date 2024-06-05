import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:flutter/material.dart';

class StandardIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;

  const StandardIcon({
    required this.icon,
    this.size,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? StandardIconSize().normalIcon,
      color: color ?? AppThemeColor.primary,
    );
  }
}
