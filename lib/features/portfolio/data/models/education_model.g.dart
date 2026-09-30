// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EducationModel _$EducationModelFromJson(Map<String, dynamic> json) =>
    _EducationModel(
      id: json['id'] as String,
      degree: json['degree'] as String,
      institution: json['institution'] as String,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      isCurrent: json['is_current'] as bool? ?? false,
    );

Map<String, dynamic> _$EducationModelToJson(_EducationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'degree': instance.degree,
      'institution': instance.institution,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_current': instance.isCurrent,
    };
