import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/features/portfolio/domain/entities/project.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'github_url') String? githubUrl,
    @JsonKey(name: 'live_url') String? liveUrl,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'tech_stack') @Default([]) List<String> techStack,
    @JsonKey(name: 'is_featured') @Default(true) bool isFeatured,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Project toEntity() => Project(
        id: id,
        title: title,
        description: description,
        githubUrl: githubUrl,
        liveUrl: liveUrl,
        imageUrl: imageUrl,
        techStack: techStack,
        isFeatured: isFeatured,
      );
}
