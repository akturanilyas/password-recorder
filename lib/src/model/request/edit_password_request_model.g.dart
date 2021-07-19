// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPasswordRequest _$EditPasswordRequestFromJson(Map<String, dynamic> json) {
  return EditPasswordRequest(
    json['id'] as String?,
    json['name'] as String?,
    json['password'] as String?,
    json['description'] as String?,
  );
}

Map<String, dynamic> _$EditPasswordRequestToJson(
        EditPasswordRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'description': instance.description,
    };
