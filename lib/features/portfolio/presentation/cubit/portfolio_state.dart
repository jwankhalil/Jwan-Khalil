import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/portfolio/domain/entities/portfolio_content.dart';

part 'portfolio_state.freezed.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState.initial() = PortfolioInitial;
  const factory PortfolioState.loading() = PortfolioLoading;
  const factory PortfolioState.success(PortfolioContent content) =
      PortfolioSuccess;
  const factory PortfolioState.error(Failure failure) = PortfolioError;
}
