import 'package:bottender_app/utils/standards/standard_icon.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';

class StandardIconButton extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final VoidCallback? onTap;

  const StandardIconButton({
    required this.icon,
    this.size,
    this.color,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: StandardIcon(
        icon: icon,
        size: size,
        color: color,
      ),
    );
  }
}

class StandardTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const StandardTextButton({
    required this.text,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Text(
        text,
        style: StandardTextStyles().title.regular,
      ),
    );
  }
}

class StandardBottomButtonModel {
  final String label;
  final IconData icon;
  final Function(int) onTap;
  final int index;
  final bool isSelected;

  const StandardBottomButtonModel({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.index,
    this.isSelected = false,
  });

  StandardBottomButtonModel copyWith({
    String? label,
    IconData? icon,
    Function(int)? onTap,
    int? index,
    bool? isSelected,
  }) {
    return StandardBottomButtonModel(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      onTap: onTap ?? this.onTap,
      index: index ?? this.index,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class StandardBottomButton extends StatelessWidget {
  final StandardBottomButtonModel model;

  const StandardBottomButton({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (() => model.onTap(model.index)),
        child: Column(
          children: [
            StandardIcon(
              icon: model.icon,
              size: StandardIconSize.medium,
              color: model.isSelected
                  ? AppThemeColor.primary
                  : AppThemeColor.greyShadeNegative,
            ),
            Text(
              model.label,
              style: model.isSelected
                  ? StandardTextStyles()
                      .callout
                      .regular
                      .copyWith(color: AppThemeColor.primary)
                  : StandardTextStyles().callout.light,
            ),
          ],
        ),
      ),
    );
  }
}
