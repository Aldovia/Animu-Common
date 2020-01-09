import 'package:equatable/equatable.dart';

abstract class MemberEvent extends Equatable {
  const MemberEvent();
}

class FetchMember extends MemberEvent {
  final String memberID;

  FetchMember({this.memberID});

  @override
  List<Object> get props => [memberID];

  @override
  String toString() => 'FetchMember {memberID: $memberID}';
}

class GiveBadge extends MemberEvent {
  final String memberID;
  final String badgeName;

  GiveBadge({this.memberID, this.badgeName});

  @override
  List<Object> get props => [memberID, badgeName];

  @override
  String toString() => 'GiveBadge {memberID: $memberID, badgeName: $badgeName}';
}

class KickMember extends MemberEvent {
  final String memberID;
  final String reason;

  KickMember({this.memberID, this.reason});

  @override
  List<Object> get props => [memberID, reason];

  @override
  String toString() => 'KickMember {memberID: $memberID, reason: $reason}';
}

class BanMember extends MemberEvent {
  final String memberID;
  final String reason;

  BanMember({this.memberID, this.reason});

  @override
  List<Object> get props => [memberID, reason];

  @override
  String toString() => 'BanMember {memberID: $memberID, reason: $reason}';
}
