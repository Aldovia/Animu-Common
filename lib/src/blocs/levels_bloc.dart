import '../events/levels_event.dart';
import '../repos/animu_repo.dart';
import '../states/levels_state.dart';
import '../models/settings.dart';
import '../models/guild.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class LevelsBloc extends Bloc<LevelsEvent, LevelsState> {
  final AnimuRepository animuRepository;

  LevelsBloc({@required this.animuRepository})
      : assert(animuRepository != null);

  @override
  LevelsState get initialState => LevelsInitial();

  @override
  Stream<LevelsState> mapEventToState(
    LevelsEvent event,
  ) async* {
    yield LevelsLoading();

    if (event is FetchLevels) {
      try {
        final Settings settings = await animuRepository.getSettings();
        final Guild guild = await animuRepository.getGuild();

        if (guild.tier == 'free')
          yield LevelsUnavailable();
        else if (settings.enableLevels)
          yield LevelsOn();
        else
          yield LevelsOff();
      } catch (e) {
        LevelsError();
      }
    }

    if (event is ToggleLevels) {
      try {
        final Settings settings = await animuRepository.updateSettings(
            key: 'enableLevels', value: event.val);

        if (settings.enableLevels)
          yield LevelsOn();
        else
          yield LevelsOff();
      } catch (e) {
        LevelsError();
      }
    }
  }
}
