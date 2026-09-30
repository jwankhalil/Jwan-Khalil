import 'package:portfolio/features/portfolio/domain/entities/certification.dart';
import 'package:portfolio/features/portfolio/domain/entities/education.dart';
import 'package:portfolio/features/portfolio/domain/entities/experience.dart';
import 'package:portfolio/features/portfolio/domain/entities/language_proficiency.dart';
import 'package:portfolio/features/portfolio/domain/entities/portfolio_content.dart';
import 'package:portfolio/features/portfolio/domain/entities/profile.dart';
import 'package:portfolio/features/portfolio/domain/entities/project.dart';
import 'package:portfolio/features/portfolio/domain/entities/skill.dart';

/// Local fallback when Supabase is not configured — mirrors seed.sql.
class PortfolioSeedData {
  const PortfolioSeedData._();

  static PortfolioContent content = PortfolioContent(
    profile: const Profile(
      fullName: 'Jwan Khalil',
      title: 'Flutter Developer | Informatics Engineer',
      summary:
          'Flutter Developer with hands-on experience building responsive, cross-platform mobile applications using Dart, Cubit (flutter_bloc), Clean Architecture, and REST APIs. Currently contributing to production Flutter apps at BSS FLOW, where I have worked on 10+ applications for clients. Freelance and academic background spanning e-commerce, content, and dashboard applications. Strong focus on scalable architecture, clean code, and effective collaboration with backend and product teams.',
      email: 'jwan8khalil@gmail.com',
      phone: '+963 936 575 588',
      location: 'Aleppo, Syria',
      linkedinUrl: 'https://linkedin.com/in/jwan-khalil',
      githubUrl: 'https://github.com/jwankhalil',
    ),
    experiences: [
      Experience(
        id: 'exp-bss',
        company: 'BSS FLOW',
        role: 'Flutter Developer',
        employmentType: 'Full-time',
        startDate: DateTime(2026, 8),
        isCurrent: true,
        highlights: const [
          'Worked on 10+ Flutter applications delivered for clients.',
          'Develop and maintain features for company Flutter applications with product and design teams.',
          'Align with backend developers on API requirements for reliable integrations.',
          'Participate in stand-ups, sprint planning, and code reviews in an agile team.',
          'Translate requirements into clear, well-structured app features.',
          'Share progress early and raise blockers to keep delivery moving.',
        ],
      ),
      Experience(
        id: 'exp-freelance',
        company: 'Freelance',
        role: 'Flutter Developer',
        employmentType: 'Contract — Restaurant Dashboard',
        startDate: DateTime(2024),
        endDate: DateTime(2024, 12),
        highlights: const [
          'Built a responsive restaurant management dashboard using Flutter.',
          'Designed and implemented UI components for menu, orders, and data display.',
          'Integrated REST APIs for real-time restaurant data and operations.',
        ],
      ),
    ],
    projects: const [
      Project(
        id: 'proj-bookly',
        title: 'Bookly App',
        description:
            'Cross-platform book discovery app fetching and displaying books from the Google Books API.',
        githubUrl: 'https://github.com/jwankhalil/Bookly.git',
        imageUrl:
            'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=1200&q=80',
        techStack: [
          'Cubit',
          'go_router',
          'Clean Architecture',
          'REST API',
          'Responsive UI',
        ],
      ),
      Project(
        id: 'proj-delivery',
        title: 'Delivery App',
        description:
            'Complete food delivery app with product catalog, cart management, payment flow, and order history.',
        githubUrl: 'https://github.com/jwankhalil/Delivery-App.git',
        imageUrl:
            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=1200&q=80',
        techStack: ['GetX', 'Custom Theming', 'Dart', 'Responsive UI'],
      ),
      Project(
        id: 'proj-news',
        title: 'News App',
        description:
            'News aggregation app integrating a third-party REST API with dynamic theming support.',
        githubUrl: 'https://github.com/jwankhalil/news-app-flutter.git',
        imageUrl:
            'https://images.unsplash.com/photo-1504711434719-226fd777bee7?w=1200&q=80',
        techStack: ['Provider', 'Dio', 'Custom Theming', 'REST API'],
      ),
      Project(
        id: 'proj-dashboard',
        title: 'Restaurant Dashboard',
        description:
            'Responsive restaurant management dashboard for menus, orders, and operational data.',
        imageUrl:
            'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=1200&q=80',
        techStack: ['Flutter', 'REST API', 'Responsive UI'],
      ),
    ],
    skills: const [
      Skill(id: 's1', category: 'State Management', name: 'BLoC', iconKey: 'bloc'),
      Skill(id: 's2', category: 'State Management', name: 'Cubit', iconKey: 'cubit'),
      Skill(id: 's3', category: 'State Management', name: 'Provider', iconKey: 'provider'),
      Skill(id: 's4', category: 'State Management', name: 'GetX', iconKey: 'getx'),
      Skill(id: 's5', category: 'Architecture', name: 'Clean Architecture', iconKey: 'architecture'),
      Skill(id: 's6', category: 'Architecture', name: 'Feature-based', iconKey: 'feature'),
      Skill(id: 's7', category: 'Architecture', name: 'MVVM', iconKey: 'mvvm'),
      Skill(id: 's8', category: 'APIs & Networking', name: 'REST API', iconKey: 'api'),
      Skill(id: 's9', category: 'APIs & Networking', name: 'Dio', iconKey: 'dio'),
      Skill(id: 's10', category: 'APIs & Networking', name: 'GraphQL', iconKey: 'graphql'),
      Skill(id: 's11', category: 'Navigation & DI', name: 'go_router', iconKey: 'router'),
      Skill(id: 's12', category: 'Navigation & DI', name: 'get_it', iconKey: 'di'),
      Skill(id: 's13', category: 'Tools', name: 'Git', iconKey: 'git'),
      Skill(id: 's14', category: 'Tools', name: 'GitHub', iconKey: 'github'),
      Skill(id: 's15', category: 'Tools', name: 'Firebase', iconKey: 'firebase'),
      Skill(id: 's16', category: 'UI', name: 'Responsive Design', iconKey: 'responsive'),
      Skill(id: 's17', category: 'UI', name: 'Theming', iconKey: 'theme'),
      Skill(id: 's18', category: 'UI', name: 'Material Design', iconKey: 'material'),
    ],
    educations: [
      Education(
        id: 'edu-master',
        degree: "Master's Degree in Web Science",
        institution: 'Syrian Virtual University (SVU)',
        startDate: DateTime(2025),
        isCurrent: true,
      ),
      Education(
        id: 'edu-bachelor',
        degree: "Bachelor's Degree in Informatics Engineering",
        institution: 'Aleppo University',
        startDate: DateTime(2019, 9),
        endDate: DateTime(2024, 9),
      ),
    ],
    certifications: const [
      Certification(
        id: 'cert-1',
        title: 'Flutter & Dart: Developing iOS, Android and Mobile Apps',
        issuer: 'Coursera',
      ),
      Certification(
        id: 'cert-2',
        title: 'The Complete Flutter Development Bootcamp with Dart',
        issuer: 'Udemy',
      ),
      Certification(
        id: 'cert-3',
        title: 'Deep Dive into Clean Architecture in Flutter',
        issuer: 'Udemy',
      ),
    ],
    languages: const [
      LanguageProficiency(id: 'lang-1', name: 'Kurdish', proficiency: 'Native'),
      LanguageProficiency(id: 'lang-2', name: 'Arabic', proficiency: 'Native'),
      LanguageProficiency(
        id: 'lang-3',
        name: 'English',
        proficiency: 'B2 – Upper Intermediate',
      ),
    ],
  );
}
