import '../models/rep_leaderboards_user.dart';
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
  final List<RepLeaderboardsUser> repLeaderboardsUsers;

  const RepLeaderboardsLoaded({@required this.repLeaderboardsUsers})
      : assert(repLeaderboardsUsers != null);

  @override
  List<Object> get props => [repLeaderboardsUsers];
}

class RepLeaderboardsError extends RepLeaderboardsState {}
