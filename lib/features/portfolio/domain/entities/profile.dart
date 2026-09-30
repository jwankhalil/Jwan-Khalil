import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.fullName,
    required this.title,
    required this.summary,
    required this.email,
    this.phone,
    this.location,
    this.linkedinUrl,
    this.githubUrl,
    this.avatarUrl,
    this.resumeUrl,
  });

  final String fullName;
  final String title;
  final String summary;
  final String email;
  final String? phone;
  final String? location;
  final String? linkedinUrl;
  final String? githubUrl;
  final String? avatarUrl;
  final String? resumeUrl;

  @override
  List<Object?> get props => [
        fullName,
        title,
        summary,
        email,
        phone,
        location,
        linkedinUrl,
        githubUrl,
        avatarUrl,
        resumeUrl,
      ];
}
