import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/portfolio/domain/usecases/get_portfolio_content_usecase.dart';
import 'package:portfolio/features/portfolio/presentation/cubit/portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit(this._getPortfolioContent)
      : super(const PortfolioState.initial());

  final GetPortfolioContentUseCase _getPortfolioContent;

  Future<void> load({required String languageCode}) async {
    emit(const PortfolioState.loading());
    final result = await _getPortfolioContent(languageCode: languageCode);
    result.fold(
      (failure) => emit(PortfolioState.error(failure)),
      (content) => emit(PortfolioState.success(content)),
    );
  }
}
