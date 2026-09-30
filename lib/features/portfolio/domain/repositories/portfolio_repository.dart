import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/portfolio/domain/entities/portfolio_content.dart';

abstract class PortfolioRepository {
  Future<Either<Failure, PortfolioContent>> getPortfolioContent({
    required String languageCode,
  });
}
