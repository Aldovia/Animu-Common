import 'package:animu_common/src/models/guild.dart';

import '../events/welcome_message_settings_event.dart';
import '../repos/animu_repo.dart';
import '../states/welcome_message_settings_state.dart';
import '../models/settings.dart';
import '../models/text_channel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class WelcomeMessageSettingsBloc
    extends Bloc<WelcomeMessageSettingsEvent, WelcomeMessageSettingsState> {
  final AnimuRepository animuRepository;

  WelcomeMessageSettingsBloc({@required this.animuRepository})
      : assert(animuRepository != null);

  @override
  WelcomeMessageSettingsState get initialState => WelcomeMessageSettingsEmpty();

  @override
  Stream<WelcomeMessageSettingsState> mapEventToState(
    WelcomeMessageSettingsEvent event,
  ) async* {
    if (event is FetchWelcomeMessageSettings) {
      yield WelcomeMessageSettingsLoading();

      try {
        final List<dynamic> welcomeMessageSettings =
            await animuRepository.getWelcomeMessageSettings();
        final Guild guild = await animuRepository.getGuild();

        final Settings settings = welcomeMessageSettings[0];
        final List<TextChannel> channels = welcomeMessageSettings[1];

        if (guild.tier == 'free' || guild.tier == 'lite')
          yield WelcomeMessageSettingsUnavailable();
        else
          yield WelcomeMessageSettingsLoaded(
              settings: settings, channels: channels);
      } catch (e) {
        WelcomeMessageSettingsError();
      }
    }

    if (event is UpdateWelcomeMessageSettings) {
      try {
        final List<dynamic> welcomeMessageSettings = await animuRepository
            .updateWelcomeMessageSettings(key: event.key, value: event.value);
        final Settings settings = welcomeMessageSettings[0];
        final List<TextChannel> channels = welcomeMessageSettings[1];
        yield WelcomeMessageSettingsLoaded(
            settings: settings, channels: channels);
      } catch (e) {
        WelcomeMessageSettingsError();
      }
    }
  }
}
