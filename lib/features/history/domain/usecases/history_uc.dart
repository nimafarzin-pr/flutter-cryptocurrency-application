import '../../data/models/market_model.dart';
import '../repositories/history_repo.dart';

import '../../../../core/network/response_model.dart';
import '../../data/models/coin_history_model.dart';

class HistoryUC {
  final HistoryRepo repository;
  HistoryUC(this.repository);

  Future<Result<CoinHistoryModel, Exception>> getHistory(
          {required String interval, required String symbolID}) async =>
      await repository.getHistory(interval: interval, symbolID: symbolID);
  Future<Result<MarketModel, Exception>> getMarket(
          {required String symbolID}) async =>
      await repository.getMarket(symbolID: symbolID);
}
