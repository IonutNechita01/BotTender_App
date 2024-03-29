import 'package:bottender_app/init/init_action.dart';
import 'package:bottender_app/models/wifi_device_model/wifi_device_model.dart';
import 'package:bottender_app/utils/standards/standard_card.dart';
import 'package:bottender_app/utils/standards/standard_empty_screen.dart';
import 'package:bottender_app/utils/standards/standard_icon.dart';
import 'package:bottender_app/utils/standards/standard_image.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:provider_for_redux/provider_for_redux.dart';

import 'package:bottender_app/devices/devices_action.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/utils/widgets/app_layout.dart';

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
          title: "BotTender Devices",
          child: Center(
            child: state.devicesState.devices.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StandardSpacing.vertical.regular,
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              _buildDeviceCard(context, state, index, store),
                          itemCount: state.devicesState.devices.length,
                          separatorBuilder: (context, index) {
                            return StandardSpacing.vertical.regular;
                          },
                        ),
                      ),
                    ],
                  )
                : StandardEmptyScreen(
                    message: "No devices found. Please try again later.",
                    onRefresh: () => store.dispatch(InitDevicesAction()),
                    isLoading: state.devicesState.isSearching,
                ),
          ),
        );
      },
    );
  }

  Widget _buildDeviceCard(
      BuildContext context, AppState state, int index, Store<AppState> store) {
    final device = state.devicesState.devices.elementAt(index);
    return StandardCard(
        onTap: () => store.dispatch(ConnectDeviceAction(device)),
        child: ListTile(
          leading: const StandardImage(
            isRounded: true,
            url: "assets/images/device_icon.jpeg",
          ),
          title: Text(
            device.name,
            style: StandardTextStyles().title.regular,
          ),
          subtitle: Text(
            "Device name",
            style: StandardTextStyles().callout.regular,
          ),
          trailing: StandardIcon(
            icon: device is WifiDeviceModel
                ? FontAwesomeIcons.wifi
                : FontAwesomeIcons.bluetooth,
            color: AppThemeColor.greyShadeNegative,
          ),
        ));
  }
}
