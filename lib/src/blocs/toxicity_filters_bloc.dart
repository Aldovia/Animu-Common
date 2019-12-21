import 'package:animu_common/src/models/guild.dart';

import '../events/toxicity_filters_settings_event.dart';
import '../repos/animu_repo.dart';
import '../states/toxicity_filters_settings_state.dart';
import '../models/settings.dart';
import '../models/text_channel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ToxicityFiltersSettingsBloc
    extends Bloc<ToxicityFiltersSettingsEvent, ToxicityFiltersSettingsState> {
  final AnimuRepository animuRepository;

  ToxicityFiltersSettingsBloc({@required this.animuRepository})
      : assert(animuRepository != null);

  @override
  ToxicityFiltersSettingsState get initialState =>
      ToxicityFiltersSettingsEmpty();

  @override
  Stream<ToxicityFiltersSettingsState> mapEventToState(
    ToxicityFiltersSettingsEvent event,
  ) async* {
    if (event is FetchToxicityFiltersSettings) {
      yield ToxicityFiltersSettingsLoading();

      try {
        final List<dynamic> toxicityFiltersSettings =
            await animuRepository.getToxicityFiltersSettings();
        final Guild guild = await animuRepository.getGuild();

        final Settings settings = toxicityFiltersSettings[0];
        final List<TextChannel> channels = toxicityFiltersSettings[1];

        if (guild.tier == 'free' || guild.tier == 'lite')
          yield ToxicityFiltersSettingsUnavailable();
        else
          yield ToxicityFiltersSettingsLoaded(
              settings: settings, channels: channels);
      } catch (e) {
        ToxicityFiltersSettingsError();
      }
    }

    if (event is UpdateToxicityFiltersSettings) {
      try {
        final List<dynamic> toxicityFiltersSettings = await animuRepository
            .updateToxicityFiltersSettings(key: event.key, value: event.value);
        final Settings settings = toxicityFiltersSettings[0];
        final List<TextChannel> channels = toxicityFiltersSettings[1];
        yield ToxicityFiltersSettingsLoaded(
            settings: settings, channels: channels);
      } catch (e) {
        ToxicityFiltersSettingsError();
      }
    }
  }
}
