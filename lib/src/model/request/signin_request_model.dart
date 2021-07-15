import 'package:json_annotation/json_annotation.dart';

part 'signin_request_model.g.dart';

@JsonSerializable()
class SignInRequest {
  final String? email;

  final String? password;

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);

  SignInRequest(this.email, this.password);

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}
