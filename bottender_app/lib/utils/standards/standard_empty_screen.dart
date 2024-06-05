import 'package:bottender_app/utils/standards/standard_buttons.dart';
import 'package:bottender_app/utils/standards/standard_image.dart';
import 'package:bottender_app/utils/standards/standard_loading.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StandardEmptyScreen extends StatelessWidget {
  final String? url;
  final String? message;
  final void Function()? onRefresh;
  final bool? isLoading;

  const StandardEmptyScreen(
      {this.url, this.message, this.onRefresh, this.isLoading, super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StandardSpacing.regular(),
        Flexible(
          flex: 3,
          child: StandardImage(url: url ?? 'assets/svg/empty_page.svg', fit: BoxFit.contain,),
        ),
        StandardSpacing.regular(),
        Expanded(
          child: Column(
            children: [
              Text(
                message ?? '',
                style: StandardTextStyles().callout.regular,
              ),
              StandardSpacing.regular(),
              if (onRefresh != null && (isLoading == null || !isLoading!))
                StandardIconButton(
                    icon: FontAwesomeIcons.arrowRotateLeft, onTap: onRefresh,),
              if (isLoading != null && isLoading!)
                const StandardLoading(),
            ],
          ),
        ),
        StandardSpacing.regular(),
      ],
    );
  }
}
