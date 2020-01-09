import 'package:animu_common/animu_common.dart';

import '../repos/animu_api_client.dart';
import '../models/growth_rate.dart';
import '../models/guild.dart';
import '../models/joined_rate.dart';
import '../models/log.dart';
import '../models/settings.dart';
import '../models/time_series_members.dart';
import 'package:meta/meta.dart';

class AnimuRepository {
  final AnimuApiClient animuApiClient;

  AnimuRepository({@required this.animuApiClient})
      : assert(animuApiClient != null);

  /// Returns Guild
  Future<Guild> getGuild() async {
    return await animuApiClient.fetchGuild();
  }

  /// Returns Member
  Future<Member> getMember(String memberID) async {
    return await animuApiClient.fetchMember(memberID);
  }

  /// Give Badge
  Future<Member> giveBadge(String memberID, String badgeName) async {
    return await animuApiClient.giveBadge(memberID, badgeName);
  }

  /// Returns Charts for home page
  Future<List<List<TimeSeriesMembers>>> getCharts(
      {int growthCycle = 7, int joinedCycle = 7}) async {
    List<TimeSeriesMembers> growthRateList = [];
    List<TimeSeriesMembers> joinedRateList = [];

    List<dynamic> charts = await Future.wait([
      animuApiClient.fetchGrowthRate(growthCycle: growthCycle),
      animuApiClient.fetchJoinedRate(joinedCycle: joinedCycle),
    ]);

    final GrowthRate growthRate = charts[0];
    final JoinedRate joinedRate = charts[1];

    for (var i = 0; i < growthRate.growthRate.length; i++) {
      growthRateList.add(
        TimeSeriesMembers(
          DateTime.now().subtract(
            Duration(days: i),
          ),
          growthRate.growthRate[i],
        ),
      );
    }

    for (var i = 0; i < joinedRate.joinedRate.length; i++) {
      joinedRateList.add(
        TimeSeriesMembers(
          DateTime.now().subtract(
            Duration(days: i),
          ),
          joinedRate.joinedRate[i],
        ),
      );
    }

    return [growthRateList, joinedRateList];
  }

  /// Returns Logs of authorized guild
  Future<List<Log>> getLogs({int limit = 20, int offset = 0}) {
    return animuApiClient.fetchLogs(limit: limit, offset: offset);
  }

  /// Returns level leaderboard of authorized guild
  Future<List<Member>> getLevelsLeaderboard() {
    return animuApiClient.fetchLevelLeaderboardsUsers();
  }

  /// Returns rep leaderboard of authorized guild
  Future<List<Member>> getRepLeaderboard() {
    return animuApiClient.fetchRepLeaderboardsUsers();
  }

  /// Returns Settings of authorized guild
  Future<Settings> getSettings() {
    return animuApiClient.fetchSettings();
  }

  /// Updates settings of authorized guild
  Future<Settings> updateSettings({String key, dynamic value}) {
    return animuApiClient.updateSettings(key: key, value: value);
  }

  /// Returns data for level settings page
  Future<List<dynamic>> getLevelSettings() async {
    List<dynamic> data = await Future.wait([
      animuApiClient.fetchSettings(),
      animuApiClient.fetchRoles(),
      animuApiClient.fetchChannels()
    ]);
    return data;
  }

  /// Update settings for Levels
  Future<List<dynamic>> updateLevelSettings(
      {@required String key, @required dynamic value}) async {
    List<dynamic> data = await Future.wait([
      animuApiClient.updateSettings(key: key, value: value),
      animuApiClient.fetchRoles(),
      animuApiClient.fetchChannels()
    ]);
    return data;
  }

  /// Returns data for rep settings page
  Future<List<dynamic>> getRepSettings() async {
    List<dynamic> data = await Future.wait([
      animuApiClient.fetchSettings(),
      animuApiClient.fetchRoles(),
      animuApiClient.fetchChannels()
    ]);
    return data;
  }

  /// Update settings for rep
  Future<List<dynamic>> updateRepSettings(
      {@required String key, @required dynamic value}) async {
    List<dynamic> data = await Future.wait([
      animuApiClient.updateSettings(key: key, value: value),
      animuApiClient.fetchRoles(),
      animuApiClient.fetchChannels()
    ]);
    return data;
  }

  /// Returns Level Perks for authorized guild
  Future<List<dynamic>> getLevelPerks() async {
    List<dynamic> data = await Future.wait([
      animuApiClient.fetchLevelPerks(),
      animuApiClient.fetchRoles(),
    ]);
    return data;
  }

  /// Creates new level perk and returns all level perks
  Future<List<dynamic>> createLevelPerk(
      {@required level, @required perkName, @required perkValue}) async {
    List<dynamic> data = await Future.wait([
      animuApiClient.createLevelPerk(
          level: level, perkName: perkName, perkValue: perkValue),
      animuApiClient.fetchRoles(),
    ]);
    return data;
  }

  /// Delete a level perk and returns all level perks
  Future<List<dynamic>> deleteLevelPerk({@required level}) async {
    List<dynamic> data = await Future.wait([
      animuApiClient.deleteLevelPerk(level: level),
      animuApiClient.fetchRoles(),
    ]);
    return data;
  }

  /// Returns data for toxicity filters page
  Future<List<dynamic>> getToxicityFiltersSettings() async {
    List<dynamic> data = await Future.wait(
        [animuApiClient.fetchSettings(), animuApiClient.fetchChannels()]);
    return data;
  }

  /// Update settings for toxicity filters
  Future<List<dynamic>> updateToxicityFiltersSettings(
      {@required String key, @required dynamic value}) async {
    List<dynamic> data = await Future.wait([
      animuApiClient.updateSettings(key: key, value: value),
      animuApiClient.fetchChannels()
    ]);
    return data;
  }

  /// Returns data for Welcome Message page
  Future<List<dynamic>> getWelcomeMessageSettings() async {
    List<dynamic> data = await Future.wait(
        [animuApiClient.fetchSettings(), animuApiClient.fetchChannels()]);
    return data;
  }

  /// Update settings for Welcome Message
  Future<List<dynamic>> updateWelcomeMessageSettings(
      {@required String key, @required dynamic value}) async {
    List<dynamic> data = await Future.wait([
      animuApiClient.updateSettings(key: key, value: value),
      animuApiClient.fetchChannels()
    ]);
    return data;
  }

  /// Returns Self roles for authorized guild
  Future<List<dynamic>> getSelfRoles() async {
    List<dynamic> data = await Future.wait([
      animuApiClient.fetchSelfRoles(),
      animuApiClient.fetchRoles(),
    ]);
    return data;
  }

  /// Returns data for self roles settings page
  Future<List<dynamic>> getSelfRolesSettings() async {
    List<dynamic> data = await Future.wait(
        [animuApiClient.fetchSettings(), animuApiClient.fetchChannels()]);
    return data;
  }

  /// Creates new self role and returns all self roles
  Future<List<dynamic>> createSelfRole(
      {@required role, @required emoji}) async {
    List<dynamic> data = await Future.wait([
      animuApiClient.createSelfRole(role: role, emoji: emoji),
      animuApiClient.fetchRoles(),
    ]);
    return data;
  }

  /// Deletes a self role and returns all self roles
  Future<List<dynamic>> deleteSelfRole({@required role}) async {
    List<dynamic> data = await Future.wait([
      animuApiClient.deleteSelfRole(role: role),
      animuApiClient.fetchRoles(),
    ]);
    return data;
  }

  /// Update settings for self roles
  Future<List<dynamic>> updateSelfRolesSettings(
      {@required String key, @required dynamic value}) async {
    List<dynamic> data = await Future.wait([
      animuApiClient.updateSettings(key: key, value: value),
      animuApiClient.fetchChannels()
    ]);
    return data;
  }
}
