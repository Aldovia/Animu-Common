import '../models/role.dart';
import '../models/settings.dart';
import '../models/text_channel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RepSettingsState extends Equatable {
  const RepSettingsState();

  @override
  List<Object> get props => [];
}

class RepSettingsEmpty extends RepSettingsState {}

class RepSettingsLoading extends RepSettingsState {}

class RepSettingsLoaded extends RepSettingsState {
  final Settings settings;
  final List<TextChannel> channels;
  final List<Role> roles;

  const RepSettingsLoaded(
      {@required this.settings, @required this.channels, @required this.roles})
      : assert(settings != null && channels != null && roles != null);

  @override
  List<Object> get props => [settings, channels, roles];
}

class RepSettingsError extends RepSettingsState {}
