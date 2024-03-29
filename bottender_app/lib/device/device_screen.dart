import 'package:bottender_app/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReduxSelector<AppState, dynamic>(
      selector: (context, state) => [state.devicesState.connectedDevice],
      builder: (context, store, state, dispatch, model, child) {
        return Column(
          children: [
            
          ],
        );
      },
    );
  }
}
