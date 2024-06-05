import 'package:bottender_app/utils/standards/standard_icon.dart';
import 'package:bottender_app/utils/standards/standard_image.dart';
import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';

class StandardListTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final String imageUrl;
  final double? padding;

  const StandardListTile({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.padding,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StandardPadding.all(
      padding: padding ?? 0,
      child: Row(
        children: [
          Flexible(child: StandardImage(url: imageUrl)),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: StandardTextStyles().title.regular),
                StandardSpacing.small(),
                Text(
                  subtitle,
                  style: StandardTextStyles().callout.regular,
                ),
              ],
            ),
          ),
          if (icon != null)
            Expanded(
                child: StandardIcon(
              icon: icon!,
              color: AppThemeColor.greyShadeNegative,
            ),),
        ],
      ),
    );
  }
}
