import 'package:json_annotation/json_annotation.dart';
import 'package:password_saver/src/model/password_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String? id;

  final String? name;

  final String? email;

  final List<Password>? password;

  User(this.id, this.name, this.email, this.password);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
