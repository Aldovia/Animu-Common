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
