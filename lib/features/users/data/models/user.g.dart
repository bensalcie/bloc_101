// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'avatar': instance.avatar,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
