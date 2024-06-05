import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/devices/config_device/config_device_action.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/standards/standard_dropdown.dart';
import 'package:bottender_app/utils/standards/standard_image.dart';
import 'package:bottender_app/utils/standards/standard_loading.dart';
import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:bottender_app/utils/widgets/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

class ConfigDeviceScreen extends StatelessWidget {
  const ConfigDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final ssidController = TextEditingController();
    return ReduxSelector<AppState, dynamic>(
      selector: (context, state) => [state.devicesState.disponibleWifis],
      builder: (context, store, state, dispatch, model, child) => AppLayout(
        title: 'Configure Device WiFi',
        bottomButtonLabel: 'Connect',
        bottomButtonFunction: () => store.dispatch(SendWifiAction(
            ssid: ssidController.text, password: passwordController.text,),),
        secondBottomButtonLabel: 'Skip for now',
        secondBottomButtonFunction: () {
          store
              .dispatch(NavigateAction.pushReplacementNamed(Routes.homeScreen));
        },
        child: state.devicesState.disponibleWifis.isNotEmpty
            ? Column(
                children: [
                  StandardSpacing.regular(),
                  const Expanded(
                      child: StandardImage(
                          url: 'assets/svg/config_device_page.svg',),),
                  StandardSpacing.regular(),
                  StandardPadding.all(
                    padding: StandardSpacingSize.regular,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select the WiFi network to connect to',
                          style: StandardTextStyles().callout.medium,
                        ),
                        StandardSpacing.regular(),
                        StandardDropdown(
                            firstItemIsInitialSelection: true,
                            controller: ssidController,
                            items: state.devicesState.disponibleWifis
                                .map((e) => e.ssid)
                                .toList(),),
                        StandardSpacing.regular(),
                        Text(
                          'Enter the password for the selected network',
                          style: StandardTextStyles().callout.medium,
                        ),
                        StandardSpacing.regular(),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          controller: passwordController,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const StandardLoading(),
      ),
    );
  }
}
