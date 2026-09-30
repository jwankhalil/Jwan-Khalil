import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/features/portfolio/domain/entities/certification.dart';

part 'certification_model.freezed.dart';
part 'certification_model.g.dart';

@freezed
abstract class CertificationModel with _$CertificationModel {
  const CertificationModel._();

  const factory CertificationModel({
    required String id,
    required String title,
    required String issuer,
    @JsonKey(name: 'credential_url') String? credentialUrl,
  }) = _CertificationModel;

  factory CertificationModel.fromJson(Map<String, dynamic> json) =>
      _$CertificationModelFromJson(json);

  Certification toEntity() => Certification(
        id: id,
        title: title,
        issuer: issuer,
        credentialUrl: credentialUrl,
      );
}
