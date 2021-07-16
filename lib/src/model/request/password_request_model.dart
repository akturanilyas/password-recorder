import 'package:json_annotation/json_annotation.dart';

part 'password_request_model.g.dart';

@JsonSerializable()
class PasswordRequest {
  final String? name;

  final String? password;

  final String? description;

  PasswordRequest(this.name, this.password, this.description);

  Map<String, dynamic> toJson() => _$PasswordRequestToJson(this);

  factory PasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordRequestFromJson(json);
}
