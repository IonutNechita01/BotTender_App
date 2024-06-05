import 'package:bottender_app/utils/standards/standard_buttons.dart';
import 'package:bottender_app/utils/standards/standard_icon.dart';
import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final bool? shouldPop;
  final String? bottomButtonLabel;
  final void Function()? bottomButtonFunction;
  final String? secondBottomButtonLabel;
  final void Function()? secondBottomButtonFunction;
  final List<StandardBottomButtonModel>? bottomActions;
  final int selectedIndex;
  final IconData? middleButtonIcon;
  final void Function()? middleButtonOnTap;
  final bool resizeToAvoidBottomInset;
  final String? midleButtonText;
  final bool safeArea;

  const AppLayout({
    required this.child,
    this.title,
    this.actions,
    this.shouldPop,
    this.bottomButtonLabel,
    this.bottomButtonFunction,
    this.secondBottomButtonLabel,
    this.secondBottomButtonFunction,
    this.bottomActions,
    this.middleButtonIcon,
    this.selectedIndex = 0,
    this.middleButtonOnTap,
    this.resizeToAvoidBottomInset = false,
    this.midleButtonText,
    this.safeArea = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 0.7],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppThemeColor.appLayoutBackground,
              AppThemeColor.positive,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: StandardPadding.only(
                bottom: StandardSpacingSize.medium,
                top: safeArea
                    ? StandardSpacingSize.regular * 2
                    : StandardSpacingSize.medium,
                left: StandardSpacingSize.regular,
                right: StandardSpacingSize.regular,
                child: Column(
                  children: [
                    Visibility(
                      visible: title != null || actions != null,
                      child: Column(
                        children: [
                          StandardSpacing.regular(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title ?? '',
                                style: StandardTextStyles().title.medium,
                              ),
                              if (actions != null) ...actions!,
                            ],
                          ),
                        ],
                      ),
                    ),
                    StandardSpacing.medium(),
                    Expanded(child: child),
                    StandardSpacing.medium(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (secondBottomButtonLabel != null)
                          ElevatedButton(
                            onPressed: secondBottomButtonFunction,
                            child: Text(
                              secondBottomButtonLabel!,
                              style: StandardTextStyles().callout.bold,
                            ),
                          ),
                        if (bottomButtonLabel != null)
                          ElevatedButton(
                            onPressed: bottomButtonFunction,
                            child: Text(
                              bottomButtonLabel!,
                              style: StandardTextStyles().callout.bold,
                            ),
                          ),
                      ],
                    ),
                    if (bottomButtonLabel != null ||
                        secondBottomButtonLabel != null)
                      StandardSpacing.medium(),
                  ],
                ),
              ),
            ),
            if (bottomActions != null)
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: StandardSpacingSize.medium,
                    ),
                    color: AppThemeColor.cardBackground,
                    child: Row(
                      children: [
                        for (final action in bottomActions!
                            .sublist(0, bottomActions!.length ~/ 2))
                          StandardBottomButton(
                            model: action.copyWith(
                              isSelected: selectedIndex == action.index,
                            ),
                          ),
                        if (middleButtonIcon != null) const SizedBox(width: 80),
                        for (final action in bottomActions!
                            .sublist(bottomActions!.length ~/ 2))
                          StandardBottomButton(
                            model: action.copyWith(
                              isSelected: selectedIndex == action.index,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (middleButtonIcon != null)
                    Positioned(
                      left: MediaQuery.of(context).size.width ~/ 2 - 30,
                      bottom: 2,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: middleButtonOnTap,
                            child: CircleAvatar(
                              backgroundColor: AppThemeColor.primary,
                              radius: 30,
                              child: StandardIcon(
                                icon: middleButtonIcon!,
                                color: AppThemeColor.greyShadeNegative,
                              ),
                            ),
                          ),
                          Text(
                            midleButtonText ?? '',
                            style: StandardTextStyles().callout.regular,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
