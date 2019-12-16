import 'package:equatable/equatable.dart';

class RepLeaderboardsUser extends Equatable {
  final String avatarUrl;
  final String username;
  final int rep;

  RepLeaderboardsUser({this.avatarUrl, this.username, this.rep});

  @override
  List<Object> get props => [avatarUrl, username, rep];

  static RepLeaderboardsUser fromJson(dynamic json) {
    return RepLeaderboardsUser(
      avatarUrl: json['avatarURL'],
      username: json['username'],
      rep: json['reputation'],
    );
  }
}
