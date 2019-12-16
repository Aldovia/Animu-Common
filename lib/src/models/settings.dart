import '../models/role.dart';
import '../models/text_channel.dart';
import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final bool enableLevels;
  final int expRate;
  final int expTime;
  final int startingRep;
  final bool banOnLowRep;
  final bool allowExpBottles;
  final List<TextChannel> ignoreExpChannels;
  final List<Role> ignoreLevelRoles;
  final List<Role> ignoreRepRoles;

  Settings({
    this.enableLevels,
    this.expRate,
    this.expTime,
    this.startingRep,
    this.banOnLowRep,
    this.allowExpBottles,
    this.ignoreExpChannels,
    this.ignoreLevelRoles,
    this.ignoreRepRoles,
  });

  @override
  List<Object> get props => [
        enableLevels,
        expRate,
        expTime,
        startingRep,
        banOnLowRep,
        allowExpBottles,
        ignoreExpChannels,
        ignoreLevelRoles,
        ignoreRepRoles,
      ];

  static Settings fromJson(
      dynamic json, dynamic channelsJson, dynamic rolesJson) {
    final List<TextChannel> tempIgnoreExpChannels = [];
    final List<Role> tempIgnoreLevelRoles = [];
    final List<Role> tempIgnoreRepRoles = [];

    for (int i = 0; i < channelsJson.length; i++) {
      if (json['ignoreExpChannels'].contains(channelsJson[i]['id']))
        tempIgnoreExpChannels.add(
          TextChannel.fromJson(channelsJson[i]),
        );
    }

    for (int i = 0; i < rolesJson.length; i++) {
      if (json['ignoreLevelRoles'].contains(rolesJson[i]['id']))
        tempIgnoreLevelRoles.add(
          Role.fromJson(rolesJson[i]),
        );

      if (json['ignoreRepRoles'].contains(rolesJson[i]['id']))
        tempIgnoreRepRoles.add(
          Role.fromJson(rolesJson[i]),
        );
    }

    return Settings(
      enableLevels: json['enableLevels'],
      expRate: json['expRate'],
      expTime: json['expTime'],
      startingRep: json['startingRep'],
      banOnLowRep: json['banOnLowRep'],
      allowExpBottles: json['allowExpBottles'],
      ignoreExpChannels: tempIgnoreExpChannels,
      ignoreLevelRoles: tempIgnoreLevelRoles,
      ignoreRepRoles: tempIgnoreRepRoles,
    );
  }
}
