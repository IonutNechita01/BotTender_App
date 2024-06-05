import 'package:bottender_app/utils/standards/standard_buttons.dart';
import 'package:bottender_app/utils/standards/standard_field.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StandardSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  const StandardSearchBar({
    required this.controller,
    required this.placeholder,
    super.key,
  });

  @override
  State<StandardSearchBar> createState() => _StandardSearchBarState();
}

class _StandardSearchBarState extends State<StandardSearchBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppThemeColor.cardBackground,
          borderRadius: StandardBorder().borderRadius,),
      child: Row(
        children: [
          Expanded(
            child: StandardField(
              backgroundColor: Colors.transparent,
              withoutBorder: true,
              controller: widget.controller,
              placeholder: widget.placeholder,
            ),
          ),
          StandardIconButton(
            icon: widget.controller.text.isEmpty
                ? FontAwesomeIcons.magnifyingGlass
                : FontAwesomeIcons.xmark,
            onTap: widget.controller.text.isEmpty
                ? () {}
                : () => widget.controller.clear(),
            size: StandardIconSize().verySmallIcon,
          ),
          StandardSpacing.regular(),
        ],
      ),
    );
  }
}
