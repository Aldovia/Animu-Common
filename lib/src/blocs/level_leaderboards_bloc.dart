import 'package:animu_common/animu_common.dart';

import '../events/level_leaderboards_event.dart';
import '../repos/animu_repo.dart';
import '../states/level_leaderboards_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class LevelLeaderboardsBloc
    extends Bloc<LevelLeaderboardsEvent, LevelLeaderboardsState> {
  final AnimuRepository animuRepository;

  LevelLeaderboardsBloc({@required this.animuRepository})
      : assert(animuRepository != null);

  @override
  LevelLeaderboardsState get initialState => LevelLeaderboardsEmpty();

  @override
  Stream<LevelLeaderboardsState> mapEventToState(
    LevelLeaderboardsEvent event,
  ) async* {
    if (event is FetchLevelLeaderboards) {
      yield LevelLeaderboardsLoading();

      try {
        final List<Member> leaderboardMembers =
            await animuRepository.getLevelsLeaderboard();
        yield LevelLeaderboardsLoaded(leaderboardMembers: leaderboardMembers);
      } catch (e) {
        LevelLeaderboardsError();
      }
    }
  }
}
