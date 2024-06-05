import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/devices/devices_action.dart';
import 'package:bottender_app/init/init_action.dart';
import 'package:bottender_app/models/wifi_device_model/wifi_device_model.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/utils/standards/standard_card.dart';
import 'package:bottender_app/utils/standards/standard_empty_screen.dart';
import 'package:bottender_app/utils/standards/standard_list_tile.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/widgets/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:provider_for_redux/provider_for_redux.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReduxSelector<AppState, dynamic>(
      selector: (context, state) {
        return [
          state.devicesState.devices,
          state.devicesState.isSearching,
        ];
      },
      builder: (context, store, state, dispatch, model, child) {
        return AppLayout(
          title: 'BotTender Devices',
          child: Center(
            child: state.devicesState.devices.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) =>
                        _buildDeviceCard(context, state, index, store),
                    itemCount: state.devicesState.devices.length,
                    separatorBuilder: (context, index) {
                      return StandardSpacing.regular();
                    },
                  )
                : StandardEmptyScreen(
                    message: 'No devices found. Please try again later.',
                    onRefresh: () => store.dispatch(InitDevicesAction()),
                    isLoading: state.devicesState.isSearching,
                  ),
          ),
        );
      },
    );
  }

  Widget _buildDeviceCard(
      BuildContext context, AppState state, int index, Store<AppState> store,) {
    final device = state.devicesState.devices.elementAt(index);
    return StandardCard(
      onTap: () => store.dispatch(ConnectDeviceAction(device)),
      child: StandardListTile(
        imageUrl: 'assets/images/device_icon.jpeg',
        title: device.name,
        subtitle: 'Device name',
        icon: device is WifiDeviceModel
            ? FontAwesomeIcons.wifi
            : FontAwesomeIcons.bluetooth,
      ),
    );
  }
}
