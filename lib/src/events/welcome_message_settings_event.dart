import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WelcomeMessageSettingsEvent extends Equatable {
  const WelcomeMessageSettingsEvent();

  @override
  List<Object> get props => [];
}

class FetchWelcomeMessageSettings extends WelcomeMessageSettingsEvent {}

class UpdateWelcomeMessageSettings extends WelcomeMessageSettingsEvent {
  final String key;
  final dynamic value;

  UpdateWelcomeMessageSettings({@required this.key, @required this.value});

  @override
  List<Object> get props => [key, value];

  @override
  String toString() =>
      'UpdateWelcomeMessageSettings {key: $key, value: $value}';
}
