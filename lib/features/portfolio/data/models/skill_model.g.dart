// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SkillModel _$SkillModelFromJson(Map<String, dynamic> json) => _SkillModel(
  id: json['id'] as String,
  category: json['category'] as String,
  name: json['name'] as String,
  iconKey: json['icon_key'] as String?,
);

Map<String, dynamic> _$SkillModelToJson(_SkillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'icon_key': instance.iconKey,
    };
