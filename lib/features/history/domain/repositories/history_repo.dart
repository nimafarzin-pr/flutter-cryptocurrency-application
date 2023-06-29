import '../../data/models/market_model.dart';

import '../../../../core/network/response_model.dart';
import '../../data/models/coin_history_model.dart';

abstract class HistoryRepo {
  Future<Result<CoinHistoryModel, Exception>> getHistory(
      {required String interval, required String symbolID});
  Future<Result<MarketModel, Exception>> getMarket({required String symbolID});
}
