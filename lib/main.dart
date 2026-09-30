import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const PortfolioApp(),
    ),
  );
}
