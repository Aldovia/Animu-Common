import 'package:shared_preferences/shared_preferences.dart';

import '../events/theme_event.dart';
import '../states/theme_state.dart';
import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeInitial();

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    yield ThemeLoading();

    if (event is FetchTheme) {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        String theme = prefs.getString('theme') ?? 'light';

        if (theme == 'light')
          yield ThemeLight();
        else
          yield ThemeDark();
      } catch (e) {
        ThemeError();
      }
    }

    if (event is ToggleTheme) {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString('theme', event.val);

        String theme = prefs.getString('theme') ?? 'light';

        if (theme == 'light')
          yield ThemeLight();
        else
          yield ThemeDark();
      } catch (e) {
        ThemeError();
      }
    }
  }
}
