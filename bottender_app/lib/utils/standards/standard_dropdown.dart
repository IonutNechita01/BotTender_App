import 'package:bottender_app/utils/others/text_utils.dart';
import 'package:bottender_app/utils/standards/standard_icon.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;

class StandardDropdown extends StatelessWidget {
  final List<String?> items;
  final TextEditingController controller;
  final String? hindText;
  final Widget? icon;

  const StandardDropdown({
    required this.items,
    required this.controller,
    this.hindText,
    this.icon,
    super.key,
  }) : assert(items.length > 0);

  @override
  Widget build(BuildContext context) {
    controller.text = items.first!;

    return DropdownMenu<String?>(
      controller: controller,
      helperText: hindText,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: StandardBorder.borderRadius,
            borderSide: BorderSide.none),
      ),
      leadingIcon: icon,
      trailingIcon: const StandardIcon(
        icon: FontAwesomeIcons.arrowDown,
      ),
      selectedTrailingIcon: const StandardIcon(icon: FontAwesomeIcons.arrowUp),
      textStyle: StandardTextStyles().callout.regular,
      menuHeight: (items.length *
          getTextHeight(style: StandardTextStyles().callout.regular)),
      initialSelection: items.first,
      dropdownMenuEntries: items.whereType<String>().map((e) {
        return DropdownMenuEntry<String?>(value: e, label: e);
      }).toList(),
    );
  }
}
