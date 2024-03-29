import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

@JsonSerializable()
class LanguageModel {
  final String name;

  final String shortName;

  LanguageModel(this.name, this.shortName);
  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);


  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}
