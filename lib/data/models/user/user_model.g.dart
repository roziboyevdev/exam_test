// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  points: json['points'] as List,
  email: json['email'] as String,
  password: json['password'] as String,
  id: (json['id'] as num).toInt(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'points': instance.points,
      'email': instance.email,
      'password': instance.password,
      'id': instance.id,
    };
