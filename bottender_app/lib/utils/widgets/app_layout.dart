import 'package:bottender_app/utils/standards/standard_buttons.dart';
import 'package:bottender_app/utils/standards/standard_icon.dart';
import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.5),
              colors: [
                AppThemeColor.primary.withOpacity(0.4),
                AppThemeColor.primary.withOpacity(0.3),
                AppThemeColor.primary.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: StandardPadding.only(
                  bottom: StandardSpacing.size.regular,
                  top: StandardSpacing.size.regular * 2,
                  left: StandardSpacing.size.medium,
                  right: StandardSpacing.size.medium,
                  child: Column(
                    children: [
                      Visibility(
                        visible: title != null || actions != null,
                        child: Column(
                          children: [
                            StandardSpacing.vertical.regular,
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
                      StandardSpacing.vertical.medium,
                      Expanded(child: child),
                      StandardSpacing.vertical.medium,
                      Row(
                        children: [
                          if (bottomButtonLabel != null)
                            ElevatedButton(
                              onPressed: bottomButtonFunction,
                              child: Text(bottomButtonLabel!),
                            ),
                          if (secondBottomButtonLabel != null)
                            ElevatedButton(
                              onPressed: secondBottomButtonFunction,
                              child: Text(secondBottomButtonLabel!),
                            ),
                        ],
                      ),
                      if (bottomButtonLabel != null ||
                          secondBottomButtonLabel != null)
                        StandardSpacing.vertical.medium,
                    ],
                  ),
                ),
              ),
              if (bottomActions != null)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: StandardSpacing.size.medium,
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          for (final action in bottomActions!
                              .sublist(0, bottomActions!.length ~/ 2))
                            StandardBottomButton(
                                model: action.copyWith(
                                    isSelected: selectedIndex == action.index)),
                          if (middleButtonIcon != null)
                            const SizedBox(width: 80),
                          for (final action in bottomActions!
                              .sublist(bottomActions!.length ~/ 2))
                            StandardBottomButton(
                                model: action.copyWith(
                                    isSelected: selectedIndex == action.index)),
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
                              'Explore',
                              style: StandardTextStyles().callout.regular,
                            ),
                          ],
                        ),
                      )
                  ],
                ),
            ],
          )),
    );
  }
}
