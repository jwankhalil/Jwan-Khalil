// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CertificationModel _$CertificationModelFromJson(Map<String, dynamic> json) =>
    _CertificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      issuer: json['issuer'] as String,
      credentialUrl: json['credential_url'] as String?,
    );

Map<String, dynamic> _$CertificationModelToJson(_CertificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'issuer': instance.issuer,
      'credential_url': instance.credentialUrl,
    };
