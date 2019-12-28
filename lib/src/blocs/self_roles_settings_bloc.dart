import '../events/self_roles_settings_event.dart';
import '../repos/animu_repo.dart';
import '../states/self_roles_settings_state.dart';
import '../models/settings.dart';
import '../models/text_channel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class SelfRolesSettingsBloc
    extends Bloc<SelfRolesSettingsEvent, SelfRolesSettingsState> {
  final AnimuRepository animuRepository;

  SelfRolesSettingsBloc({@required this.animuRepository})
      : assert(animuRepository != null);

  @override
  SelfRolesSettingsState get initialState => SelfRolesSettingsEmpty();

  @override
  Stream<SelfRolesSettingsState> mapEventToState(
    SelfRolesSettingsEvent event,
  ) async* {
    if (event is FetchSelfRolesSettings) {
      yield SelfRolesSettingsLoading();

      try {
        final List<dynamic> selfRolesSettings =
            await animuRepository.getSelfRolesSettings();
        final Settings settings = selfRolesSettings[0];
        final List<TextChannel> channels = selfRolesSettings[1];
        yield SelfRolesSettingsLoaded(settings: settings, channels: channels);
      } catch (e) {
        SelfRolesSettingsError();
      }
    }

    if (event is UpdateSelfRolesSettings) {
      try {
        final List<dynamic> repSettings = await animuRepository
            .updateSelfRolesSettings(key: event.key, value: event.value);
        final Settings settings = repSettings[0];
        final List<TextChannel> channels = repSettings[1];
        yield SelfRolesSettingsLoaded(settings: settings, channels: channels);
      } catch (e) {
        SelfRolesSettingsError();
      }
    }
  }
}
