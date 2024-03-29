import 'package:android_flutter_wifi/android_flutter_wifi.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/standards/standard_dropdown.dart';
import 'package:bottender_app/utils/standards/standard_image.dart';
import 'package:bottender_app/utils/standards/standard_loading.dart';
import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:bottender_app/utils/widgets/app_layout.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:flutter/material.dart';

class ConfigDeviceScreen extends StatefulWidget {
  const ConfigDeviceScreen({super.key});

  @override
  State<ConfigDeviceScreen> createState() => _ConfigDeviceScreenState();
}

class _ConfigDeviceScreenState extends State<ConfigDeviceScreen> {
  @override
  void initState() {
    super.initState();
    getWifis();
  }

  final List<WifiNetwork> disponibleWifis = [];
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ssidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: ((_) {
        store.dispatch(NavigateAction.pushReplacementNamed(Routes.homeScreen));
      }),
      child: AppLayout(
        title: "Configure Device WiFi",
        bottomButtonLabel: 'Connect',
        bottomButtonFunction: sendWifiCredentials,
        secondBottomButtonLabel: 'Skip for now',
        secondBottomButtonFunction: () {
          store.dispatch(NavigateAction.pop());
        },
        child: disponibleWifis.isNotEmpty
            ? Column(
                children: [
                  StandardSpacing.vertical.regular,
                  const StandardImage(url: 'assets/svg/config_device_page.svg'),
                  StandardSpacing.vertical.regular,
                  StandardPadding.all(
                    padding: StandardSpacing.size.regular,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select the WiFi network to connect to',
                          style: StandardTextStyles().callout.medium,
                        ),
                        StandardSpacing.vertical.regular,
                        StandardDropdown(
                            controller: ssidController,
                            items: disponibleWifis.map((e) => e.ssid).toList()),
                        StandardSpacing.vertical.regular,
                        Text(
                          'Enter the password for the selected network',
                          style: StandardTextStyles().callout.medium,
                        ),
                        StandardSpacing.vertical.regular,
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          controller: passwordController,
                        )
                      ],
                    ),
                  ),
                ],
              )
            : const StandardLoading(),
      ),
    );
  }

  Future<void> getWifis() async {
    final wifis = await AndroidFlutterWifi.getWifiScanResult();
    final connectedWifiName =
        (await NetworkInfo().getWifiName())?.replaceAll('"', '');
    wifis.sort((a, b) {
      if (a.ssid == connectedWifiName) return -1;
      if (b.ssid == connectedWifiName) return 1;
      if (a.level == null || b.level == null) return 0;
      return b.level!.compareTo(a.level!);
    });
    wifis.removeWhere((element) => element.ssid == "");
    setState(() {
      disponibleWifis.addAll(wifis);
    });
  }

  Future<void> sendWifiCredentials() async {
    final response =
        await store.state.devicesState.connectedDevice!.send(data: {
      'ssid': ssidController.text,
      'password': passwordController.text,
    }, path: 'wifi-credentials');
    if (response == null) {
      return;
    }
    if (response["status"] == "0") {
    } else {}
    store.dispatch(NavigateAction.pop());
  }
}
