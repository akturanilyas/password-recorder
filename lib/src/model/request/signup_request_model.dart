import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignUpRequest {
  final String? username;

  final String? email;

  final String? password;

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);

  SignUpRequest(this.username, this.email, this.password);

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}
