import 'package:portfolio/features/portfolio/domain/entities/portfolio_content.dart';

abstract class PortfolioRemoteDataSource {
  Future<PortfolioContent> fetchPortfolioContent({required String languageCode});
}
