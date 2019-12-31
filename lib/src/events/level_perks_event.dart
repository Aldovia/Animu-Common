import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LevelPerksEvent extends Equatable {
  const LevelPerksEvent();

  @override
  List<Object> get props => [];
}

class FetchLevelPerks extends LevelPerksEvent {}

class CreateLevelPerk extends LevelPerksEvent {
  final int level;
  final String perkName;
  final dynamic perkValue;

  CreateLevelPerk(
      {@required this.level,
      @required this.perkName,
      @required this.perkValue});

  @override
  List<Object> get props => [level, perkName, perkValue];

  @override
  String toString() =>
      'CreateLevelPerk {level: $level, perkName: $perkName, perkValue: $perkValue}';
}

class DeleteLevelPerk extends LevelPerksEvent {
  final int level;

  DeleteLevelPerk({
    @required this.level,
  });

  @override
  List<Object> get props => [level];

  @override
  String toString() => 'DeleteLevelPerk {level: $level}';
}
