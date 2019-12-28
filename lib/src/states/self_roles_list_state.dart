import 'package:animu_common/src/models/role.dart';
import 'package:animu_common/src/models/self_role.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SelfRolesListState extends Equatable {
  const SelfRolesListState();

  @override
  List<Object> get props => [];
}

class SelfRolesListEmpty extends SelfRolesListState {}

class SelfRolesListLoading extends SelfRolesListState {}

class SelfRolesListLoaded extends SelfRolesListState {
  final List<SelfRole> selfRoles;
  final List<Role> roles;

  const SelfRolesListLoaded({@required this.selfRoles, @required this.roles})
      : assert(selfRoles != null && roles != null);

  @override
  List<Object> get props => [selfRoles, roles];
}

class SelfRolesListError extends SelfRolesListState {}
