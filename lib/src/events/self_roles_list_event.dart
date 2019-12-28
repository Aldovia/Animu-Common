import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SelfRolesListEvent extends Equatable {
  const SelfRolesListEvent();

  @override
  List<Object> get props => [];
}

class FetchSelfRolesList extends SelfRolesListEvent {}

class CreateSelfRole extends SelfRolesListEvent {
  final String role;
  final String emoji;

  CreateSelfRole({
    @required this.role,
    @required this.emoji,
  });

  @override
  List<Object> get props => [role, emoji];

  @override
  String toString() => 'CreateSelfRole {role: $role, emoji: $emoji}';
}
