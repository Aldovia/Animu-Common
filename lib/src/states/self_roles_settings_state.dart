import '../models/settings.dart';
import '../models/text_channel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SelfRolesSettingsState extends Equatable {
  const SelfRolesSettingsState();

  @override
  List<Object> get props => [];
}

class SelfRolesSettingsEmpty extends SelfRolesSettingsState {}

class SelfRolesSettingsLoading extends SelfRolesSettingsState {}

class SelfRolesSettingsLoaded extends SelfRolesSettingsState {
  final Settings settings;
  final List<TextChannel> channels;

  const SelfRolesSettingsLoaded(
      {@required this.settings, @required this.channels})
      : assert(settings != null && channels != null);

  @override
  List<Object> get props => [settings, channels];
}

class SelfRolesSettingsError extends SelfRolesSettingsState {}
