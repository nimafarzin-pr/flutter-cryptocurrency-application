import '../../../../core/network/response_model.dart';
import '../datasources/remote/candlestick_ds.dart';
import '../models/candlestick_model.dart';
import '../models/ohlc_model.dart';
import '../../domain/repositories/candlestick_repo.dart';

class CandleStickRepositoryImpl extends CandleStickRepository {
  final CandleStickDataSource dataSource;

  CandleStickRepositoryImpl(this.dataSource);
  @override
  Future<Result<CandleStickModel, Exception>> getCandleStickMarkets() async =>
      await dataSource.getCandleStickMarkets();

  @override
  Future<Result<OHLCModel, Exception>> getOHLC(
          {required String pair, required String exchange}) async =>
      await dataSource.getOHLC(pair: pair, exchange: exchange);
}
