-- Seed data from Jwan Khalil resume — run after migration

truncate table
  public.languages,
  public.certifications,
  public.educations,
  public.skills,
  public.projects,
  public.experiences,
  public.profiles,
  public.site_settings
restart identity cascade;

insert into public.profiles (
  full_name, title, summary, email, phone, location, linkedin_url, github_url, avatar_url
) values (
  'Jwan Khalil',
  'Flutter Developer | Informatics Engineer',
  'Flutter Developer with hands-on experience building responsive, cross-platform mobile applications using Dart, Cubit (flutter_bloc), Clean Architecture, and REST APIs. Currently contributing to production Flutter apps at BSS FLOW, with a freelance and academic background spanning e-commerce, content, and dashboard applications. Strong focus on scalable architecture, clean code, and effective collaboration with backend and product teams.',
  'jwan8khalil@gmail.com',
  '+963 936 575 588',
  'Aleppo, Syria',
  'https://linkedin.com/in/jwan-khalil',
  'https://github.com/jwankhalil',
  null
);

insert into public.experiences (
  company, role, employment_type, start_date, end_date, is_current, highlights, sort_order
) values
(
  'BSS FLOW',
  'Flutter Developer',
  'Full-time',
  '2026-08-01',
  null,
  true,
  array[
    'Develop and maintain features for company Flutter applications with product and design teams.',
    'Align with backend developers on API requirements for reliable integrations.',
    'Participate in stand-ups, sprint planning, and code reviews in an agile team.',
    'Translate requirements into clear, well-structured app features.',
    'Share progress early and raise blockers to keep delivery moving.'
  ],
  0
),
(
  'Freelance',
  'Flutter Developer',
  'Contract',
  '2024-01-01',
  '2024-12-31',
  false,
  array[
    'Built a responsive restaurant management dashboard using Flutter.',
    'Designed and implemented UI components for menu, orders, and data display.',
    'Integrated REST APIs for real-time restaurant data and operations.'
  ],
  1
);

insert into public.projects (
  title, description, github_url, image_url, tech_stack, sort_order, is_featured
) values
(
  'Bookly App',
  'Cross-platform book discovery app fetching and displaying books from the Google Books API.',
  'https://github.com/jwankhalil/Bookly.git',
  'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=1200&q=80',
  array['Cubit', 'go_router', 'Clean Architecture', 'REST API', 'Responsive UI'],
  0,
  true
),
(
  'Delivery App',
  'Complete food delivery app with product catalog, cart management, payment flow, and order history.',
  'https://github.com/jwankhalil/Delivery-App.git',
  'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=1200&q=80',
  array['GetX', 'Custom Theming', 'Dart', 'Responsive UI'],
  1,
  true
),
(
  'News App',
  'News aggregation app integrating a third-party REST API with dynamic theming support.',
  'https://github.com/jwankhalil/news-app-flutter.git',
  'https://images.unsplash.com/photo-1504711434719-226fd777bee7?w=1200&q=80',
  array['Provider', 'Dio', 'Custom Theming', 'REST API'],
  2,
  true
),
(
  'Restaurant Dashboard',
  'Responsive restaurant management dashboard for menus, orders, and operational data.',
  null,
  'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=1200&q=80',
  array['Flutter', 'REST API', 'Responsive UI'],
  3,
  true
);

insert into public.skills (category, name, icon_key, sort_order) values
('State Management', 'BLoC', 'bloc', 0),
('State Management', 'Cubit', 'cubit', 1),
('State Management', 'Provider', 'provider', 2),
('State Management', 'GetX', 'getx', 3),
('Architecture', 'Clean Architecture', 'architecture', 4),
('Architecture', 'Feature-based structure', 'feature', 5),
('Architecture', 'MVVM', 'mvvm', 6),
('APIs & Networking', 'REST API', 'api', 7),
('APIs & Networking', 'Dio', 'dio', 8),
('APIs & Networking', 'GraphQL', 'graphql', 9),
('Navigation & DI', 'go_router', 'router', 10),
('Navigation & DI', 'get_it', 'di', 11),
('Tools', 'Git', 'git', 12),
('Tools', 'GitHub', 'github', 13),
('Tools', 'Firebase', 'firebase', 14),
('UI', 'Responsive Design', 'responsive', 15),
('UI', 'Theming', 'theme', 16),
('UI', 'Material Design', 'material', 17);

insert into public.educations (
  degree, institution, start_date, end_date, is_current, sort_order
) values
(
  'Master''s Degree in Web Science',
  'Syrian Virtual University (SVU)',
  '2025-01-01',
  null,
  true,
  0
),
(
  'Bachelor''s Degree in Informatics Engineering',
  'Aleppo University',
  '2019-09-01',
  '2024-09-01',
  false,
  1
);

insert into public.certifications (title, issuer, sort_order) values
('Flutter & Dart: Developing iOS, Android and Mobile Apps', 'Coursera', 0),
('The Complete Flutter Development Bootcamp with Dart', 'Udemy', 1),
('Deep Dive into Clean Architecture in Flutter', 'Udemy', 2);

insert into public.languages (name, proficiency, sort_order) values
('Kurdish', 'Native', 0),
('Arabic', 'Native', 1),
('English', 'B2 – Upper Intermediate', 2);

insert into public.site_settings (site_title, default_theme, seo_description) values
(
  'Jwan Khalil — Flutter Developer',
  'system',
  'Portfolio of Jwan Khalil, Flutter Developer & Informatics Engineer building scalable cross-platform apps.'
);
