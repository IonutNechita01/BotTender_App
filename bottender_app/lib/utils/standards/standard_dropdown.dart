import 'dart:math';

import 'package:bottender_app/utils/others/text_utils.dart';
import 'package:bottender_app/utils/standards/standard_icon.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;

class StandardDropdown extends StatelessWidget {
  final Iterable<String?> items;
  final TextEditingController? controller;
  final String? hindText;
  final Widget? icon;
  final bool? firstItemIsInitialSelection;
  final void Function(String?)? onSelected;
  final bool readOnly;
  final String? errorText;

  const StandardDropdown({
    required this.items,
    this.errorText,
    this.controller,
    this.hindText,
    this.icon,
    this.firstItemIsInitialSelection = false,
    this.onSelected,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (firstItemIsInitialSelection!) {
      controller?.text = items.first!;
    }

    return DropdownMenu<String?>(
      errorText: errorText,
      enabled: !readOnly && items.isNotEmpty,
      onSelected: onSelected,
      width: MediaQuery.of(context).size.width * 0.72,
      controller: controller,
      hintText: hindText,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: StandardSpacingSize.regular,
        ),
        fillColor: AppThemeColor.cardBackground.withOpacity(0.6),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: StandardBorder(useSmallRadiusSize: true).borderRadius,
          borderSide: StandardBorder().side,
        ),
        errorMaxLines: 2,
        errorStyle: StandardTextStyles()
            .footnote
            .bold
            .copyWith(color: AppThemeColor.error),
      ),
      leadingIcon: icon,
      trailingIcon: StandardIcon(
        icon: FontAwesomeIcons.arrowDown,
        size: StandardIconSize().verySmallIcon,
      ),
      selectedTrailingIcon: StandardIcon(
        icon: FontAwesomeIcons.arrowUp,
        size: StandardIconSize().verySmallIcon,
      ),
      textStyle: StandardTextStyles().callout.regular,
      menuHeight: max(
          items.length *
              (getTextHeight(style: StandardTextStyles().callout.regular) +
                  StandardSpacingSize.regular),
          MediaQuery.of(context).size.height * 0.4,),
      initialSelection:
          firstItemIsInitialSelection == true ? items.first : null,
      dropdownMenuEntries: items.whereType<String>().map((e) {
        return DropdownMenuEntry<String?>(value: e, label: e);
      }).toList(),
    );
  }
}
