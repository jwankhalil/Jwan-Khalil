import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/features/portfolio/data/datasources/portfolio_remote_data_source.dart';
import 'package:portfolio/features/portfolio/data/models/certification_model.dart';
import 'package:portfolio/features/portfolio/data/models/education_model.dart';
import 'package:portfolio/features/portfolio/data/models/experience_model.dart';
import 'package:portfolio/features/portfolio/data/models/language_model.dart';
import 'package:portfolio/features/portfolio/data/models/profile_model.dart';
import 'package:portfolio/features/portfolio/data/models/project_model.dart';
import 'package:portfolio/features/portfolio/data/models/skill_model.dart';
import 'package:portfolio/features/portfolio/data/seed/portfolio_seed_data.dart';
import 'package:portfolio/features/portfolio/domain/entities/portfolio_content.dart';

/// Loads portfolio sections from `assets/content/<lang>/…` JSON files.
class PortfolioLocalDataSource implements PortfolioRemoteDataSource {
  const PortfolioLocalDataSource();

  static const _supported = {'en', 'ar'};

  @override
  Future<PortfolioContent> fetchPortfolioContent({
    required String languageCode,
  }) async {
    final lang = _supported.contains(languageCode) ? languageCode : 'en';
    final base = 'assets/content/$lang';

    try {
      final profileJson = await _loadMap('$base/profile.json');
      final experiencesJson = await _loadList('$base/experiences.json');
      final projectsJson = await _loadList('$base/projects.json');
      final skillsJson = await _loadList('$base/skills.json');
      final educationsJson = await _loadList('$base/educations.json');
      final certificationsJson = await _loadList('$base/certifications.json');
      final languagesJson = await _loadList('$base/languages.json');

      return PortfolioContent(
        profile: ProfileModel.fromJson(profileJson).toEntity(),
        experiences: experiencesJson
            .map(ExperienceModel.fromJson)
            .map((m) => m.toEntity())
            .toList(),
        projects: projectsJson
            .map(ProjectModel.fromJson)
            .map((m) => m.toEntity())
            .toList(),
        skills: skillsJson
            .map(SkillModel.fromJson)
            .map((m) => m.toEntity())
            .toList(),
        educations: educationsJson
            .map(EducationModel.fromJson)
            .map((m) => m.toEntity())
            .toList(),
        certifications: certificationsJson
            .map(CertificationModel.fromJson)
            .map((m) => m.toEntity())
            .toList(),
        languages: languagesJson
            .map(LanguageModel.fromJson)
            .map((m) => m.toEntity())
            .toList(),
      );
    } catch (_) {
      return PortfolioSeedData.content;
    }
  }

  Future<Map<String, dynamic>> _loadMap(String path) async {
    final raw = await rootBundle.loadString(path);
    return Map<String, dynamic>.from(jsonDecode(raw) as Map);
  }

  Future<List<Map<String, dynamic>>> _loadList(String path) async {
    final raw = await rootBundle.loadString(path);
    return (jsonDecode(raw) as List<dynamic>)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }
}
