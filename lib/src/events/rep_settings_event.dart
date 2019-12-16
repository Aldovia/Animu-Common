import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RepSettingsEvent extends Equatable {
  const RepSettingsEvent();

  @override
  List<Object> get props => [];
}

class FetchRepSettings extends RepSettingsEvent {}

class UpdateRepSettings extends RepSettingsEvent {
  final String key;
  final dynamic value;

  UpdateRepSettings({@required this.key, @required this.value});

  @override
  List<Object> get props => [key, value];

  @override
  String toString() => 'UpdateRepSettings {key: $key, value: $value}';
}
