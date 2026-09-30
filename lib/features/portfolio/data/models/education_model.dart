import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/features/portfolio/domain/entities/education.dart';

part 'education_model.freezed.dart';
part 'education_model.g.dart';

@freezed
abstract class EducationModel with _$EducationModel {
  const EducationModel._();

  const factory EducationModel({
    required String id,
    required String degree,
    required String institution,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'is_current') @Default(false) bool isCurrent,
  }) = _EducationModel;

  factory EducationModel.fromJson(Map<String, dynamic> json) =>
      _$EducationModelFromJson(json);

  Education toEntity() => Education(
        id: id,
        degree: degree,
        institution: institution,
        startDate: startDate == null ? null : DateTime.parse(startDate!),
        endDate: endDate == null ? null : DateTime.parse(endDate!),
        isCurrent: isCurrent,
      );
}
