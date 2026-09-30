import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/features/portfolio/domain/entities/language_proficiency.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
abstract class LanguageModel with _$LanguageModel {
  const LanguageModel._();

  const factory LanguageModel({
    required String id,
    required String name,
    required String proficiency,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  LanguageProficiency toEntity() => LanguageProficiency(
        id: id,
        name: name,
        proficiency: proficiency,
      );
}
