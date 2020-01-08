import 'package:animu_common/animu_common.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LevelLeaderboardsState extends Equatable {
  const LevelLeaderboardsState();

  @override
  List<Object> get props => [];
}

class LevelLeaderboardsEmpty extends LevelLeaderboardsState {}

class LevelLeaderboardsLoading extends LevelLeaderboardsState {}

class LevelLeaderboardsLoaded extends LevelLeaderboardsState {
  final List<Member> leaderboardMembers;

  const LevelLeaderboardsLoaded({@required this.leaderboardMembers})
      : assert(leaderboardMembers != null);

  @override
  List<Object> get props => [leaderboardMembers];
}

class LevelLeaderboardsError extends LevelLeaderboardsState {}
