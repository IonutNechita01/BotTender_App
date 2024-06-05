import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';

class StandardField extends StatelessWidget {
  final TextEditingController controller;
  final EdgeInsets? contentPadding;
  final bool readOnly;
  final String? label;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final int lines;
  final TextInputType? keyboardType;
  final String? placeholder;
  final bool withoutBorder;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  const StandardField({
    required this.controller,
    this.onSaved,
    this.onChanged,
    this.label,
    this.readOnly = false,
    this.contentPadding,
    this.backgroundColor,
    this.validator,
    this.lines = 1,
    this.keyboardType,
    this.placeholder,
    this.withoutBorder = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: lines,
      controller: controller,
      readOnly: readOnly,
      style: StandardTextStyles().callout.regular,
      cursorColor: AppThemeColor.primary,
      decoration: _setDecoration(context),
      validator: validator,
    );
  }

  InputDecoration _setDecoration(context) {
    const borderWidth = 0.5;
    final border = !withoutBorder
        ? setFieldBorder(
            color: AppThemeColor.greyShadeNegative,
            width: borderWidth,
            readOnly: readOnly,
          )
        : InputBorder.none;
    final errorBorder = !withoutBorder
        ? setFieldBorder(
            color: AppThemeColor.error,
            width: borderWidth,
            error: true,
            readOnly: readOnly,
          )
        : InputBorder.none;
    final focusBorder = !withoutBorder
        ? setFieldBorder(
            color: AppThemeColor.primary,
            width: borderWidth * 2,
            readOnly: readOnly,
          )
        : InputBorder.none;
    return InputDecoration(
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            horizontal: StandardSpacingSize.regular,
            vertical: StandardSpacingSize.medium,
          ),
      errorMaxLines: 5,
      fillColor:
          backgroundColor ?? AppThemeColor.cardBackground.withOpacity(0.6),
      filled: true,
      label: label != null
          ? Text(
              label!,
              style: StandardTextStyles()
                  .callout
                  .regular
                  .copyWith(color: AppThemeColor.greyShadeNegative),
            )
          : null,
      focusColor: AppThemeColor.primary,
      border: border,
      disabledBorder: border,
      focusedBorder: focusBorder,
      enabledBorder: border,
      focusedErrorBorder: errorBorder,
      hintStyle: StandardTextStyles()
          .callout
          .regular
          .copyWith(color: AppThemeColor.negative),
      hintText: placeholder,
      errorStyle: StandardTextStyles()
          .footnote
          .regular
          .copyWith(color: AppThemeColor.error),
      errorBorder: errorBorder,
    );
  }
}

InputBorder setFieldBorder({
  required Color color,
  required double width,
  bool error = false,
  bool readOnly = false,
}) {
  final borderColor = readOnly && !error ? Colors.transparent : color;
  final borderSide = BorderSide(color: borderColor, width: width);
  return UnderlineInputBorder(
    borderSide: borderSide,
  );
}
