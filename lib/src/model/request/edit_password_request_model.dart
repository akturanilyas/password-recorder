import 'package:json_annotation/json_annotation.dart';

part 'edit_password_request_model.g.dart';

@JsonSerializable()
class EditPasswordRequest {
  final String? id;

  final String? name;

  final String? password;

  final String? description;

  EditPasswordRequest(this.id, this.name, this.password, this.description);

  Map<String, dynamic> toJson() => _$EditPasswordRequestToJson(this);

  factory EditPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$EditPasswordRequestFromJson(json);
}
