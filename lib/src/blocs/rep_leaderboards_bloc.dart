import 'package:animu_common/animu_common.dart';

import '../events/rep_leaderboards_event.dart';
import '../repos/animu_repo.dart';
import '../states/rep_leaderboards_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class RepLeaderboardsBloc
    extends Bloc<RepLeaderboardsEvent, RepLeaderboardsState> {
  final AnimuRepository animuRepository;

  RepLeaderboardsBloc({@required this.animuRepository})
      : assert(animuRepository != null);

  @override
  RepLeaderboardsState get initialState => RepLeaderboardsEmpty();

  @override
  Stream<RepLeaderboardsState> mapEventToState(
    RepLeaderboardsEvent event,
  ) async* {
    if (event is FetchRepLeaderboards) {
      yield RepLeaderboardsLoading();

      try {
        final List<Member> leaderboardMembers =
            await animuRepository.getRepLeaderboard();
        yield RepLeaderboardsLoaded(leaderboardMembers: leaderboardMembers);
      } catch (e) {
        RepLeaderboardsError();
      }
    }
  }
}
