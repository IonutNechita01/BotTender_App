import 'package:async_redux/async_redux.dart';

import 'package:bottender_app/redux/app_state.dart';

final Store<AppState> store = Store<AppState>(
  initialState: const AppState.initial(),
  actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
);
