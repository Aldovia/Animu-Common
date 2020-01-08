import 'package:animu_common/animu_common.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RepLeaderboardsState extends Equatable {
  const RepLeaderboardsState();

  @override
  List<Object> get props => [];
}

class RepLeaderboardsEmpty extends RepLeaderboardsState {}

class RepLeaderboardsLoading extends RepLeaderboardsState {}

class RepLeaderboardsLoaded extends RepLeaderboardsState {
  final List<Member> leaderboardMembers;

  const RepLeaderboardsLoaded({@required this.leaderboardMembers})
      : assert(leaderboardMembers != null);

  @override
  List<Object> get props => [leaderboardMembers];
}

class RepLeaderboardsError extends RepLeaderboardsState {}
