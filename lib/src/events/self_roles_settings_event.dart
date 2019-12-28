import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SelfRolesSettingsEvent extends Equatable {
  const SelfRolesSettingsEvent();

  @override
  List<Object> get props => [];
}

class FetchSelfRolesSettings extends SelfRolesSettingsEvent {}

class UpdateSelfRolesSettings extends SelfRolesSettingsEvent {
  final String key;
  final dynamic value;

  UpdateSelfRolesSettings({@required this.key, @required this.value});

  @override
  List<Object> get props => [key, value];

  @override
  String toString() => 'UpdateSelfRolesSettings {key: $key, value: $value}';
}
