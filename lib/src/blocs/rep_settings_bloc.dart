import '../events/rep_settings_event.dart';
import '../repos/animu_repo.dart';
import '../states/rep_settings_state.dart';
import '../models/role.dart';
import '../models/settings.dart';
import '../models/text_channel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class RepSettingsBloc extends Bloc<RepSettingsEvent, RepSettingsState> {
  final AnimuRepository animuRepository;

  RepSettingsBloc({@required this.animuRepository})
      : assert(animuRepository != null);

  @override
  RepSettingsState get initialState => RepSettingsEmpty();

  @override
  Stream<RepSettingsState> mapEventToState(
    RepSettingsEvent event,
  ) async* {
    if (event is FetchRepSettings) {
      yield RepSettingsLoading();

      try {
        final List<dynamic> repSettings =
            await animuRepository.getRepSettings();
        final Settings settings = repSettings[0];
        final List<Role> roles = repSettings[1];
        final List<TextChannel> channels = repSettings[2];
        yield RepSettingsLoaded(
            settings: settings, channels: channels, roles: roles);
      } catch (e) {
        RepSettingsError();
      }
    }

    if (event is UpdateRepSettings) {
      try {
        final List<dynamic> repSettings = await animuRepository
            .updateRepSettings(key: event.key, value: event.value);
        final Settings settings = repSettings[0];
        final List<Role> roles = repSettings[1];
        final List<TextChannel> channels = repSettings[2];
        yield RepSettingsLoaded(
            settings: settings, channels: channels, roles: roles);
      } catch (e) {
        RepSettingsError();
      }
    }
  }
}
