import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/features/portfolio/domain/entities/experience.dart';

part 'experience_model.freezed.dart';
part 'experience_model.g.dart';

@freezed
abstract class ExperienceModel with _$ExperienceModel {
  const ExperienceModel._();

  const factory ExperienceModel({
    required String id,
    required String company,
    required String role,
    @JsonKey(name: 'employment_type') String? employmentType,
    String? location,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'is_current') @Default(false) bool isCurrent,
    @Default([]) List<String> highlights,
  }) = _ExperienceModel;

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);

  Experience toEntity() => Experience(
        id: id,
        company: company,
        role: role,
        employmentType: employmentType,
        location: location,
        startDate: DateTime.parse(startDate),
        endDate: endDate == null ? null : DateTime.parse(endDate!),
        isCurrent: isCurrent,
        highlights: highlights,
      );
}
