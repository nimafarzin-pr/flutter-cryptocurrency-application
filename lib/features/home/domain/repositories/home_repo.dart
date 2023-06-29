import '../../data/models/markets_model.dart';

import '../../../../core/network/response_model.dart';
import '../../data/models/coin_summary_model.dart';

abstract class HomeRepository {
  Future<Result<CoinSummaryModel, Exception>> getCoinSummaryList();
  Future<Result<MarketsModel, Exception>> getAllMarkets();
}
