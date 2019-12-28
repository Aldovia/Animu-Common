import '../models/role.dart';
import 'package:equatable/equatable.dart';

class SelfRole extends Equatable {
  final String emoji;
  final Role role;

  SelfRole({this.emoji, this.role});

  @override
  List<Object> get props => [emoji, role];

  static SelfRole fromJson(dynamic json, dynamic rolesJson) {
    Role role;

    for (int i = 0; i < rolesJson.length; i++) {
      if (json['roleName'] == rolesJson[i]['name'])
        role = Role.fromJson(rolesJson[i]);
    }
    return SelfRole(
      emoji: json['emojiName'],
      role: role,
    );
  }
}
