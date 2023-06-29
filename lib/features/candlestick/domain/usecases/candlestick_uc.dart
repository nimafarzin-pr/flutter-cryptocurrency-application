import '../repositories/candlestick_repo.dart';

import '../../../../core/network/response_model.dart';
import '../../data/models/candlestick_model.dart';
import '../../data/models/ohlc_model.dart';

class CandleStickUseCase {
  final CandleStickRepository request;
  CandleStickUseCase(this.request);
  Future<Result<CandleStickModel, Exception>> getCandleStickMarkets() async =>
      await request.getCandleStickMarkets();

  Future<Result<OHLCModel, Exception>> getOHLC(
          {required String pair, required String exchange}) async =>
      await request.getOHLC(pair: pair, exchange: exchange);
}
