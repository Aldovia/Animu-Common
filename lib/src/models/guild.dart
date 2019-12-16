import 'package:equatable/equatable.dart';

class Guild extends Equatable {
  final String id;
  final String name;
  final int memberCount;
  final int onlineMemberCount;
  final int nitroBoostersCount;
  final int nitroLevel;
  final String tier;

  const Guild(
      {this.id,
      this.name,
      this.memberCount,
      this.onlineMemberCount,
      this.nitroBoostersCount,
      this.nitroLevel,
      this.tier});

  @override
  List<Object> get props => [
        id,
        name,
        memberCount,
        onlineMemberCount,
        nitroBoostersCount,
        nitroLevel,
        tier
      ];

  static Guild fromJson(dynamic json) {
    final guild = json['guild'];
    return Guild(
      id: guild['id'],
      name: guild['name'],
      memberCount: guild['memberCount'],
      onlineMemberCount: guild['onlineMemberCount'],
      nitroBoostersCount: guild['nitroBoostersCount'],
      nitroLevel: guild['nitroLevel'],
      tier: guild['tier'],
    );
  }
}