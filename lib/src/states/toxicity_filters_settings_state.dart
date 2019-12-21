import '../models/settings.dart';
import '../models/text_channel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ToxicityFiltersSettingsState extends Equatable {
  const ToxicityFiltersSettingsState();

  @override
  List<Object> get props => [];
}

class ToxicityFiltersSettingsEmpty extends ToxicityFiltersSettingsState {}

class ToxicityFiltersSettingsLoading extends ToxicityFiltersSettingsState {}

class ToxicityFiltersSettingsLoaded extends ToxicityFiltersSettingsState {
  final Settings settings;
  final List<TextChannel> channels;

  const ToxicityFiltersSettingsLoaded(
      {@required this.settings, @required this.channels})
      : assert(settings != null && channels != null);

  @override
  List<Object> get props => [settings, channels];
}

class ToxicityFiltersSettingsUnavailable extends ToxicityFiltersSettingsState {}

class ToxicityFiltersSettingsError extends ToxicityFiltersSettingsState {}
