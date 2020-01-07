import '../models/settings.dart';
import '../models/text_channel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WelcomeMessageSettingsState extends Equatable {
  const WelcomeMessageSettingsState();

  @override
  List<Object> get props => [];
}

class WelcomeMessageSettingsEmpty extends WelcomeMessageSettingsState {}

class WelcomeMessageSettingsLoading extends WelcomeMessageSettingsState {}

class WelcomeMessageSettingsLoaded extends WelcomeMessageSettingsState {
  final Settings settings;
  final List<TextChannel> channels;

  const WelcomeMessageSettingsLoaded(
      {@required this.settings, @required this.channels})
      : assert(settings != null && channels != null);

  @override
  List<Object> get props => [settings, channels];
}

class WelcomeMessageSettingsUnavailable extends WelcomeMessageSettingsState {}

class WelcomeMessageSettingsError extends WelcomeMessageSettingsState {}
