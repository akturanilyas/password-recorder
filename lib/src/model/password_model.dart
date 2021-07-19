import 'package:json_annotation/json_annotation.dart';
import 'package:password_saver/src/model/user_model.dart';

part 'password_model.g.dart';

@JsonSerializable()
class Password {
  final String? id;

  final String? name;

  final String? description;

  final User? user;

  final String? password;

  Password(this.id, this.name, this.description, this.user, this.password);

  factory Password.fromJson(Map<String, dynamic> json) =>
      _$PasswordFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordToJson(this);
}
