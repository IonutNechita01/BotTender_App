import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/init/init_action.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/standards/standard_loading.dart';
import 'package:bottender_app/utils/widgets/app_layout.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _ititializeApp();
    return const AppLayout(child: StandardLoading());
  }

  Future<void> _ititializeApp() async {
    await store.dispatchAndWait(InitDevicesAction());
    print('Devices initialized');
    await store.dispatchAndWait(InitCocktailsAction());
    await store.dispatchAndWait(InitFavoritesCocktailsAction());
    store.dispatch(NavigateAction.pushReplacementNamed(Routes.devicesScreen));
  }
}
