// ignore_for_file: use_colored_box

import 'package:bottender_app/cocktails/cocktails_screen.dart';
import 'package:bottender_app/device/device_screen.dart';
import 'package:bottender_app/home/home_action.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/standards/standard_buttons.dart';
import 'package:bottender_app/utils/widgets/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:provider_for_redux/provider_for_redux.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomActions = _buildBottomActions();
    final screens = _buildScreens();

    return ReduxSelector<AppState, dynamic>(
      selector: (context, state) => [
        state.homeState.currentIndexPage,
      ],
      builder: (context, store, state, dispatch, model, child) {
        return AppLayout(
          selectedIndex: state.homeState.currentIndexPage,
          bottomActions: bottomActions,
          middleButtonIcon: FontAwesomeIcons.magnifyingGlass,
          middleButtonOnTap: () => store.dispatch(ChangeHomePageAction(4)),
          midleButtonText: 'Search',
          child: screens[state.homeState.currentIndexPage],
        );
      },
    );
  }

  void _onBottomButtonTap(int index) {
    store.dispatch(ChangeHomePageAction(index));
  }

  List<Widget> _buildScreens() {
    return [
      Container(color: Colors.red, child: const Text('settings')),
      const DeviceScreen(),
      Container(color: Colors.black, child: const Text('settings')),
      Container(color: Colors.orange, child: const Text('settings')),
      const CocktailsScreen(),
    ];
  }

  List<StandardBottomButtonModel> _buildBottomActions() {
    return [
      StandardBottomButtonModel(
        label: 'Home',
        icon: FontAwesomeIcons.house,
        onTap: _onBottomButtonTap,
        index: 0,
      ),
      StandardBottomButtonModel(
        label: 'Device',
        icon: FontAwesomeIcons.microchip,
        onTap: _onBottomButtonTap,
        index: 1,
      ),
      StandardBottomButtonModel(
        label: 'Saved',
        icon: FontAwesomeIcons.bookmark,
        onTap: _onBottomButtonTap,
        index: 2,
      ),
      StandardBottomButtonModel(
        label: 'settings',
        icon: FontAwesomeIcons.gear,
        onTap: _onBottomButtonTap,
        index: 3,
      ),
    ];
  }
}
