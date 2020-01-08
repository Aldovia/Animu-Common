import 'package:animu_common/animu_common.dart';

import 'package:equatable/equatable.dart';

abstract class MemberState extends Equatable {
  const MemberState();

  @override
  List<Object> get props => [];
}

class MemberUninitialized extends MemberState {}

class MemberLoading extends MemberState {}

class MemberLoaded extends MemberState {
  final Member member;

  const MemberLoaded({this.member});
  @override
  List<Object> get props => [member];

  @override
  String toString() => 'MemberLoaded { member: $member}';
}

class MemberError extends MemberState {}
