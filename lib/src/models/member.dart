import 'package:equatable/equatable.dart';

class Member extends Equatable {
  final String id;
  final String username;
  final String tag;
  final String displayName;
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
    return Member(
      id: json['id'],
      username: json['username'],
      displayName: json['displayName'],
      description: json['description'],
      favoriteAnime: json['favoriteAnime'],
      profileColor: json['profileColor'],
      profileWallpaperURL: json['profileWallpaperURL'],
      marriedTo: json['marriedTo'],
      badges: json['badges'],
      activeBadge: json['activeBadges'],
      level: json['level'],
      exp: json['exp'],
      reputation: json['reputation'],
    );
  }
}
