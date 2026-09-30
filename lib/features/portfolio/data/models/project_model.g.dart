// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    _ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      githubUrl: json['github_url'] as String?,
      liveUrl: json['live_url'] as String?,
      imageUrl: json['image_url'] as String?,
      techStack:
          (json['tech_stack'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFeatured: json['is_featured'] as bool? ?? true,
    );

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'github_url': instance.githubUrl,
      'live_url': instance.liveUrl,
      'image_url': instance.imageUrl,
      'tech_stack': instance.techStack,
      'is_featured': instance.isFeatured,
    };
