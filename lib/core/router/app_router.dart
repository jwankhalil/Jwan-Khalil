import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/app_routes.dart';
import 'package:portfolio/features/portfolio/presentation/pages/portfolio_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const PortfolioPage(),
    ),
  ],
);
