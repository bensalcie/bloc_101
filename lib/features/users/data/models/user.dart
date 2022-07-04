import 'dart:io';

import 'package:bloc_101/features/users/domain/entities/user.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required super.id,
    required super.avatar,
    required super.email,
  }) : super(firstName: firstName, lastName: lastName);

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
