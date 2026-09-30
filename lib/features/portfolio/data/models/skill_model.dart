import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/features/portfolio/domain/entities/skill.dart';

part 'skill_model.freezed.dart';
part 'skill_model.g.dart';

@freezed
abstract class SkillModel with _$SkillModel {
  const SkillModel._();

  const factory SkillModel({
    required String id,
    required String category,
    required String name,
    @JsonKey(name: 'icon_key') String? iconKey,
  }) = _SkillModel;

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);

  Skill toEntity() => Skill(
        id: id,
        category: category,
        name: name,
        iconKey: iconKey,
      );
}
