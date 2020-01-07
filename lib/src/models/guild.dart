import 'dart:convert';

import 'package:animu_common/src/models/member.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class Guild extends Equatable {
  final String id;
  final String name;
  final Member owner;
  final int memberCount;
  final int onlineMemberCount;
  final int nitroBoostersCount;
  final int nitroLevel;
  final String tier;

  const Guild(
      {this.id,
      this.name,
      this.owner,
      this.memberCount,
      this.onlineMemberCount,
      this.nitroBoostersCount,
      this.nitroLevel,
      this.tier});

  @override
  List<Object> get props => [
        id,
        name,
        owner,
        memberCount,
        onlineMemberCount,
        nitroBoostersCount,
        nitroLevel,
        tier
      ];

  static Future<Guild> fromJson(
      dynamic json, String baseUrl, String token) async {
    final guild = json['guild'];

    final String memberUrl =
        '$baseUrl/api/members/${guild['ownerID']}?token=$token';
    final http.Response ownerResponse = await http.get(memberUrl);

    if (ownerResponse.statusCode != 200) {
      throw Exception('error getting growth rate');
    }

    final ownerJSON = jsonDecode(ownerResponse.body);

    return Guild(
      id: guild['id'],
      name: guild['name'],
      owner: Member.fromJson(ownerJSON),
      memberCount: guild['memberCount'],
      onlineMemberCount: guild['onlineMemberCount'],
      nitroBoostersCount: guild['nitroBoostersCount'],
      nitroLevel: guild['nitroLevel'],
      tier: guild['tier'],
    );
  }
}
