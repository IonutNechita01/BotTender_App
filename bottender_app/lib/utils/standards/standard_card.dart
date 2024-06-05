import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:flutter/material.dart';

class StandardCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? padding;
  final EdgeInsets? margin;
  final ShapeBorder? shape;
  final double? elevation;
  final void Function()? onTap;

  const StandardCard({
    required this.child,
    this.color,
    this.padding,
    this.margin,
    this.shape,
    this.elevation,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          margin: margin ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            color: color,
            gradient: color == null
                ? LinearGradient(
                    stops: const [
                      0.0,
                      0.1,
                      0.5,
                      1.0,
                    ],
                    colors: [
                      AppThemeColor.primary.withOpacity(0.2),
                      AppThemeColor.primary.withOpacity(0.4),
                      AppThemeColor.primary.withOpacity(0.6),
                      AppThemeColor.primary.withOpacity(0.2),
                    ],
                  )
                : null,
            borderRadius: StandardBorder().borderRadius,
          ),
          child: StandardPadding.all(
            padding: padding ?? StandardSpacingSize.small,
            child: child,
          ),
        ),
        if (onTap != null)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: StandardBorder().borderRadius,
                onTap: onTap,
              ),
            ),
          ),
      ],
    );
  }
}
