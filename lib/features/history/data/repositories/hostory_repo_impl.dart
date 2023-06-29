import '../../../../core/network/response_model.dart';
import '../../domain/repositories/history_repo.dart';
import '../datasources/remote/history_data_source.dart';
import '../models/coin_history_model.dart';
import '../models/market_model.dart';

class HistoryRepoImpl extends HistoryRepo {
  final GetHistoryDetailDS dataSource;
  HistoryRepoImpl(this.dataSource);

  @override
  Future<Result<CoinHistoryModel, Exception>> getHistory(
      {required String interval, required String symbolID}) async {
    return await dataSource.getHistory(interval: interval, symbolID: symbolID);
  }

  @override
  Future<Result<MarketModel, Exception>> getMarket(
      {required String symbolID}) async {
    return await dataSource.getMarkets(symbolID: symbolID);
  }
}
