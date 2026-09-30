import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/portfolio/data/datasources/portfolio_remote_data_source.dart';
import 'package:portfolio/features/portfolio/data/seed/portfolio_seed_data.dart';
import 'package:portfolio/features/portfolio/domain/entities/portfolio_content.dart';
import 'package:portfolio/features/portfolio/domain/repositories/portfolio_repository.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  const PortfolioRepositoryImpl(this._remoteDataSource);

  final PortfolioRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, PortfolioContent>> getPortfolioContent({
    required String languageCode,
  }) async {
    try {
      final content = await _remoteDataSource.fetchPortfolioContent(
        languageCode: languageCode,
      );
      return Right(content);
    } catch (_) {
      return Right(PortfolioSeedData.content);
    }
  }
}
