import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_dimens.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/core/theme/theme_cubit.dart';
import 'package:portfolio/injection_container.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ThemeCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(AppDimens.designWidth, AppDimens.designHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp.router(
                title: 'Jwan Khalil — Flutter Developer',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light(),
                darkTheme: AppTheme.dark(),
                themeMode: themeMode,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                routerConfig: appRouter,
              );
            },
          );
        },
      ),
    );
  }
}
