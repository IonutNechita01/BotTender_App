import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/standards/standard_buttons.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';

abstract class StandardModal {
  static final List<Future<void>?> _dialogs = [];

  static void showStandardModal<T>({
    required BuildContext context,
    Widget? child,
    bool canPop = true,
    String? title,
    String? description,
    Future<void> Function(T)? afterCallback,
    String? rightButtonText,
    void Function()? onRightButtonTap,
    String? leftButtonText,
    void Function()? onLeftButtonTap,
    String? midleButtonText,
    void Function()? onMidleButtonTap,
    bool buttonsInRow = true,
  }) {
    final rightButton = rightButtonText != null
        ? StandardTextButton(
            onTap: onRightButtonTap ?? hideStandardModal,
            text: rightButtonText,
          )
        : const Flexible(
            child: StandardTextButton(
              onTap: hideStandardModal,
              text: 'OK',
            ),
          );
    final leftButton = leftButtonText != null
        ? Flexible(
            child: StandardTextButton(
              onTap: onLeftButtonTap ?? hideStandardModal,
              text: leftButtonText,
            ),
          )
        : null;
    final midleButton = midleButtonText != null
        ? Flexible(
            child: StandardTextButton(
              onTap: onMidleButtonTap,
              text: midleButtonText,
            ),
          )
        : null;
    final modalChild = child != null
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
                borderRadius: StandardBorder().borderRadius, child: child,),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(description ?? '',
                    style: StandardTextStyles().callout.regular,),
              ),
              StandardSpacing.regular(),
              Flexible(
                child: Row(
                  mainAxisAlignment: midleButtonText != null
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (leftButton != null) leftButton,
                    if (buttonsInRow && midleButton != null)
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            midleButton,
                            rightButton,
                          ],
                        ),
                      ),
                    if (!buttonsInRow && midleButton != null)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          midleButton,
                          rightButton,
                        ],
                      ),
                    if (midleButton == null) rightButton,
                  ],
                ),
              ),
            ],
          );
    final newDialog = showDialog<T>(
      barrierColor: AppThemeColor.barrierColor,
      context: context,
      barrierDismissible: canPop,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: child != null
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(
                  horizontal: StandardSpacingSize.regular,
                  vertical: StandardSpacingSize.regular,),
          surfaceTintColor: AppThemeColor.cardBackground,
          backgroundColor: AppThemeColor.cardBackground,
          title: child != null
              ? null
              : Text(title ?? '', style: StandardTextStyles().title.bold),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: child != null
                  ? MediaQuery.of(context).size.height * 0.8
                  : MediaQuery.of(context).size.height * 0.5,
            ),
            child: modalChild,
          ),
        );
      },
    ).then((value) async {
      if (afterCallback != null && value != null) {
        await afterCallback(value);
      }
    });
    _dialogs.add(newDialog);
  }

  static void hideStandardModal() {
    if (_dialogs.last != null) {
      store.dispatch(NavigateAction.pop());
    }
  }
}
