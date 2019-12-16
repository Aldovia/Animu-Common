import 'package:equatable/equatable.dart';

abstract class RepLeaderboardsEvent extends Equatable {
  const RepLeaderboardsEvent();

  @override
  List<Object> get props => [];
}

class FetchRepLeaderboards extends RepLeaderboardsEvent {}
