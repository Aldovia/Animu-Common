import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ToxicityFiltersSettingsEvent extends Equatable {
  const ToxicityFiltersSettingsEvent();

  @override
  List<Object> get props => [];
}

class FetchToxicityFiltersSettings extends ToxicityFiltersSettingsEvent {}

class UpdateToxicityFiltersSettings extends ToxicityFiltersSettingsEvent {
  final String key;
  final dynamic value;

  UpdateToxicityFiltersSettings({@required this.key, @required this.value});

  @override
  List<Object> get props => [key, value];

  @override
  String toString() =>
      'UpdateToxicityFiltersSettings {key: $key, value: $value}';
}
