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
  final bool deleteToxicMessages;
  final List<TextChannel> ignoreExpChannels;
  final TextChannel selfRolesChannel;
  final List<Role> ignoreLevelRoles;
  final List<Role> ignoreRepRoles;
  final String selfRolesMessage;

  // Toxicity Filters
  final bool filterToxicity;
  final bool filterSevereToxicity;
  final bool filterProfanity;
  final bool filterInsult;
  final bool filterThreat;
  final bool filterIdentityAttack;
  final bool filterSexuallyExplicit;
  final bool filterFlirtation;

  // Welcome Message
  final TextChannel welcomeChannel;
  final String welcomeMessage;
  final String welcomeImageURL;

  // Log Channels
  final TextChannel logReports;

  Settings({
    this.enableLevels,
    this.expRate,
    this.expTime,
    this.startingRep,
    this.banOnLowRep,
    this.allowExpBottles,
    this.deleteToxicMessages,
    this.ignoreExpChannels,
    this.selfRolesChannel,
    this.ignoreLevelRoles,
    this.ignoreRepRoles,
    this.selfRolesMessage,
    this.filterToxicity,
    this.filterSevereToxicity,
    this.filterProfanity,
    this.filterInsult,
    this.filterThreat,
    this.filterIdentityAttack,
    this.filterSexuallyExplicit,
    this.filterFlirtation,
    this.welcomeChannel,
    this.welcomeMessage,
    this.welcomeImageURL,
    this.logReports,
  });

  @override
  List<Object> get props => [
        enableLevels,
        expRate,
        expTime,
        startingRep,
        banOnLowRep,
        allowExpBottles,
        deleteToxicMessages,
        ignoreExpChannels,
        selfRolesChannel,
        ignoreLevelRoles,
        ignoreRepRoles,
        selfRolesMessage,
        filterToxicity,
        filterSevereToxicity,
        filterProfanity,
        filterInsult,
        filterThreat,
        filterIdentityAttack,
        filterSexuallyExplicit,
        filterFlirtation,
        welcomeChannel,
        welcomeMessage,
        welcomeImageURL,
        logReports,
      ];

  static Settings fromJson(
      dynamic json, dynamic channelsJson, dynamic rolesJson) {
    final List<TextChannel> tempIgnoreExpChannels = [];
    final List<Role> tempIgnoreLevelRoles = [];
    final List<Role> tempIgnoreRepRoles = [];
    TextChannel tempReportsChannel;
    TextChannel tempSelfRolesChannel;
    TextChannel tempWelcomeChannel;

    for (int i = 0; i < channelsJson.length; i++) {
      if (json['ignoreExpChannels'].contains(channelsJson[i]['id']))
        tempIgnoreExpChannels.add(
          TextChannel.fromJson(channelsJson[i]),
        );

      if (json['logChannels']['reports'] == channelsJson[i]['id'])
        tempReportsChannel = TextChannel.fromJson(channelsJson[i]);

      if (json['selfRolesChannel'] == channelsJson[i]['id'])
        tempSelfRolesChannel = TextChannel.fromJson(channelsJson[i]);

      if (json['welcomeChannel'] == channelsJson[i]['id'])
        tempWelcomeChannel = TextChannel.fromJson(channelsJson[i]);
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
      deleteToxicMessages: json['deleteToxicMessages'],
      ignoreExpChannels: tempIgnoreExpChannels,
      selfRolesChannel: tempSelfRolesChannel,
      ignoreLevelRoles: tempIgnoreLevelRoles,
      ignoreRepRoles: tempIgnoreRepRoles,
      selfRolesMessage: json['selfRolesMessage'],
      logReports: tempReportsChannel,
      filterToxicity: json['toxicityFilters']['toxicity'] ?? false,
      filterSevereToxicity: json['toxicityFilters']['severeToxicity'] ?? false,
      filterProfanity: json['toxicityFilters']['profanity'] ?? false,
      filterInsult: json['toxicityFilters']['insult'] ?? false,
      filterThreat: json['toxicityFilters']['threat'] ?? false,
      filterIdentityAttack: json['toxicityFilters']['identityAttack'] ?? false,
      filterSexuallyExplicit:
          json['toxicityFilters']['sexuallyExplicit'] ?? false,
      filterFlirtation: json['toxicityFilters']['flirtation'] ?? false,
      welcomeChannel: tempWelcomeChannel,
      welcomeMessage: json['welcomeMessage'],
      welcomeImageURL: json['welcomeImageURL'],
    );
  }
}
