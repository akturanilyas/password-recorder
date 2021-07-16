// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordRequest _$PasswordRequestFromJson(Map<String, dynamic> json) {
  return PasswordRequest(
    json['name'] as String?,
    json['password'] as String?,
    json['description'] as String?,
  );
}

Map<String, dynamic> _$PasswordRequestToJson(PasswordRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'description': instance.description,
    };
