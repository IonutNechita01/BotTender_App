import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/standards/standard_loading.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:flutter/material.dart';

class StandardLoadingModal {
  static late Future<void>? _dialog;

  static void showStandardLoadingModal(
      {required BuildContext context, String? text, bool canPop = false}) {
    _dialog = showDialog(
      barrierColor: AppThemeColor.cardBackground.withOpacity(0.4),
      context: context,
      barrierDismissible: canPop,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: StandardLoading());
      },
    ).then((_) => _dialog = null);
  }

  static void hideStandardLoadingModal() {
    if (_dialog != null) {
      store.dispatch(NavigateAction.pop());
      _dialog = null;
    }
  }
}
