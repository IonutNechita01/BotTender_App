import 'package:android_flutter_wifi/android_flutter_wifi.dart';
import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/devices/config_device/config_device_screen.dart';
import 'package:bottender_app/devices/devices_screen.dart';
import 'package:bottender_app/firebase_options.dart';
import 'package:bottender_app/home/home_screen.dart';
import 'package:bottender_app/init/init_action.dart';
import 'package:bottender_app/init/init_screen.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await AndroidFlutterWifi.init();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (_) {
  }
  NavigateAction.setNavigatorKey(navigatorKey);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final Key key = UniqueKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        store.state.devicesState.connectedDevice == null &&
        !store.state.devicesState.isSearching) {
      store.dispatch(InitDevicesAction());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Remove after testing
    // store.dispatch(SetDeviceForTestingAction());
    return AsyncReduxProvider<AppState>.value(
      value: store,
      key: key,
      child: OKToast(
        backgroundColor: AppThemeColor.primary,
        radius: 8,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Bottender',
          home: const InitScreen(),
          routes: {
            Routes.devicesScreen: (context) => const DevicesScreen(),
            Routes.configDevice: (context) => const ConfigDeviceScreen(),
            Routes.homeScreen: (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
