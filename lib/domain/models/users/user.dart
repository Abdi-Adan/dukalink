// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class DukalinkUser {
  DukalinkUser({
    required this.uid,
    required this.name,
    required this.phoneNumber,
  });

  final String? uid;
  final String? name;
  final String? phoneNumber;

  factory DukalinkUser.fromJson(Map<String, dynamic> json) =>
      _$DukalinkUserFromJson(json);

  Map<String, dynamic> toJson() => _$DukalinkUserToJson(this);
}
