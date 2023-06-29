import '../../data/models/markets_model.dart';
import '../repositories/home_repo.dart';

import '../../../../core/network/response_model.dart';
import '../../data/models/coin_summary_model.dart';

class HomeUseCase {
  final HomeRepository repository;
  HomeUseCase(this.repository);

  Future<Result<CoinSummaryModel, Exception>> getCoinSummaryList() async =>
      await repository.getCoinSummaryList();
  Future<Result<MarketsModel, Exception>> getAllMarkets() async =>
      await repository.getAllMarkets();
}
