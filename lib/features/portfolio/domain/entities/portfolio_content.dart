import 'package:equatable/equatable.dart';
import 'package:portfolio/features/portfolio/domain/entities/certification.dart';
import 'package:portfolio/features/portfolio/domain/entities/education.dart';
import 'package:portfolio/features/portfolio/domain/entities/experience.dart';
import 'package:portfolio/features/portfolio/domain/entities/language_proficiency.dart';
import 'package:portfolio/features/portfolio/domain/entities/profile.dart';
import 'package:portfolio/features/portfolio/domain/entities/project.dart';
import 'package:portfolio/features/portfolio/domain/entities/skill.dart';

class PortfolioContent extends Equatable {
  const PortfolioContent({
    required this.profile,
    required this.experiences,
    required this.projects,
    required this.skills,
    required this.educations,
    required this.certifications,
    required this.languages,
  });

  final Profile profile;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Skill> skills;
  final List<Education> educations;
  final List<Certification> certifications;
  final List<LanguageProficiency> languages;

  Map<String, List<Skill>> get skillsByCategory {
    final map = <String, List<Skill>>{};
    for (final skill in skills) {
      map.putIfAbsent(skill.category, () => []).add(skill);
    }
    return map;
  }

  @override
  List<Object?> get props => [
        profile,
        experiences,
        projects,
        skills,
        educations,
        certifications,
        languages,
      ];
}
