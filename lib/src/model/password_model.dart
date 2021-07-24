import 'package:json_annotation/json_annotation.dart';

part 'password_model.g.dart';

@JsonSerializable()
class Password {
  final String? id;

  final String? name;

  final String? description;

  final String? password;

  Password({this.id, this.name, this.description, this.password});

  factory Password.fromJson(Map<String, dynamic> json) =>
      _$PasswordFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'password': password,
    };
  }

  factory Password.fromMap(Map<String, dynamic> json) => Password(
        id: json['id'].toString(),
        name: json['name'].toString(),
        description: json['description'].toString(),
        password: json['password'].toString(),
      );
}
