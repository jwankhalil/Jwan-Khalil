// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) =>
    _ExperienceModel(
      id: json['id'] as String,
      company: json['company'] as String,
      role: json['role'] as String,
      employmentType: json['employment_type'] as String?,
      location: json['location'] as String?,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      isCurrent: json['is_current'] as bool? ?? false,
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExperienceModelToJson(_ExperienceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'role': instance.role,
      'employment_type': instance.employmentType,
      'location': instance.location,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_current': instance.isCurrent,
      'highlights': instance.highlights,
    };
