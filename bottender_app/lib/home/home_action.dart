import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/redux/app_state.dart';

class ChangeHomePageAction extends ReduxAction<AppState> {
  final int page;

  ChangeHomePageAction(this.page);

  @override
  AppState reduce() {
    final currentIndexPage = state.homeState.currentIndexPage;
    return state.copyWith.homeState
        .call(lastIndexPage: currentIndexPage, currentIndexPage: page);
  }
}
