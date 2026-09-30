import 'package:get_it/get_it.dart';
import 'package:portfolio/core/theme/theme_cubit.dart';
import 'package:portfolio/features/portfolio/data/datasources/portfolio_local_data_source.dart';
import 'package:portfolio/features/portfolio/data/datasources/portfolio_remote_data_source.dart';
import 'package:portfolio/features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:portfolio/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:portfolio/features/portfolio/domain/usecases/get_portfolio_content_usecase.dart';
import 'package:portfolio/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);
  sl.registerLazySingleton(() => ThemeCubit(sl()));

  // Local-only content — no backend.
  sl.registerLazySingleton<PortfolioRemoteDataSource>(
    () => const PortfolioLocalDataSource(),
  );
  sl.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetPortfolioContentUseCase(sl()));
  sl.registerFactory(() => PortfolioCubit(sl()));
}
