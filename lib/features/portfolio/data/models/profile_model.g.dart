// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      fullName: json['full_name'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      location: json['location'] as String?,
      linkedinUrl: json['linkedin_url'] as String?,
      githubUrl: json['github_url'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      resumeUrl: json['resume_url'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'title': instance.title,
      'summary': instance.summary,
      'email': instance.email,
      'phone': instance.phone,
      'location': instance.location,
      'linkedin_url': instance.linkedinUrl,
      'github_url': instance.githubUrl,
      'avatar_url': instance.avatarUrl,
      'resume_url': instance.resumeUrl,
    };
