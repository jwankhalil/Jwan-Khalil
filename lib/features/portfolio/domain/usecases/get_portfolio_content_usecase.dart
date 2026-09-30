import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/portfolio/domain/entities/portfolio_content.dart';
import 'package:portfolio/features/portfolio/domain/repositories/portfolio_repository.dart';

class GetPortfolioContentUseCase {
  const GetPortfolioContentUseCase(this._repository);

  final PortfolioRepository _repository;

  Future<Either<Failure, PortfolioContent>> call({
    required String languageCode,
  }) {
    return _repository.getPortfolioContent(languageCode: languageCode);
  }
}
