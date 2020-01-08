import 'package:equatable/equatable.dart';

class Member extends Equatable {
  final String id;
  final String username;
  final String tag;
  final String displayName;
  final String avatarURL;
  final String description;
  final String favoriteAnime;
  final String profileColor;
  final String profileWallpaperURL;
  final String marriedTo;
  final List<String> badges;
  final String activeBadge;
  final int level;
  final int exp;
  final int reputation;

  Member(
      {this.id,
      this.username,
      this.tag,
      this.displayName,
      this.avatarURL,
      this.description,
      this.favoriteAnime,
      this.profileColor,
      this.profileWallpaperURL,
      this.marriedTo,
      this.badges,
      this.activeBadge,
      this.level,
      this.exp,
      this.reputation});

  @override
  List<Object> get props => [
        id,
        username,
        tag,
        displayName,
        avatarURL,
        description,
        favoriteAnime,
        profileColor,
        profileWallpaperURL,
        marriedTo,
        badges,
        activeBadge,
        level,
        exp,
        reputation
      ];

  static Member fromJson(dynamic json) {
    final member = json['member'];

    return Member(
      id: member['id'],
      username: member['username'],
      tag: member['tag'],
      displayName: member['displayName'],
      avatarURL: member['avatarURL'],
      description: member['description'],
      favoriteAnime: member['favoriteAnime'],
      profileColor: member['profileColor'],
      profileWallpaperURL: member['profileWallpaperURL'],
      marriedTo: member['marriedTo'],
      badges:
          member['badges']['badges'] != [] && member['badges']['badges'] != ''
              ? member['badges']["badges"].cast<String>()
              : [''],
      activeBadge: member["badges"]['activeBadge'],
      level: member['level']['level'],
      exp: member['level']['exp'],
      reputation: member['reputation'],
    );
  }
}
