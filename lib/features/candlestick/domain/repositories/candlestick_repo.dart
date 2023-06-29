import '../../../../core/network/response_model.dart';
import '../../data/models/candlestick_model.dart';
import '../../data/models/ohlc_model.dart';

abstract class CandleStickRepository {
  Future<Result<CandleStickModel, Exception>> getCandleStickMarkets();

  Future<Result<OHLCModel, Exception>> getOHLC(
      {required String pair, required String exchange});
}
