import 'package:equatable/equatable.dart';

class Project extends Equatable {
  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.techStack,
    this.githubUrl,
    this.liveUrl,
    this.imageUrl,
    this.isFeatured = true,
  });

  final String id;
  final String title;
  final String description;
  final String? githubUrl;
  final String? liveUrl;
  final String? imageUrl;
  final List<String> techStack;
  final bool isFeatured;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        githubUrl,
        liveUrl,
        imageUrl,
        techStack,
        isFeatured,
      ];
}
