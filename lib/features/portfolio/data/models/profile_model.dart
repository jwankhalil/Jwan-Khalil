import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/features/portfolio/domain/entities/profile.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    @JsonKey(name: 'full_name') required String fullName,
    required String title,
    required String summary,
    required String email,
    String? phone,
    String? location,
    @JsonKey(name: 'linkedin_url') String? linkedinUrl,
    @JsonKey(name: 'github_url') String? githubUrl,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'resume_url') String? resumeUrl,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Profile toEntity() => Profile(
        fullName: fullName,
        title: title,
        summary: summary,
        email: email,
        phone: phone,
        location: location,
        linkedinUrl: linkedinUrl,
        githubUrl: githubUrl,
        avatarUrl: avatarUrl,
        resumeUrl: resumeUrl,
      );
}
