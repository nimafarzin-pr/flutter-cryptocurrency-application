import '../../models/ohlc_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/network/constant/endpoints.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/response_model.dart';
import '../../models/candlestick_model.dart';

class CandleStickDataSource {
  final DioClient _dio;
  CandleStickDataSource(this._dio);

  Future<Result<CandleStickModel, Exception>> getCandleStickMarkets() async {
    final url = '${Endpoints.baseUrl[ApiType.cryptoWatch]}markets';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        CandleStickModel jsonResponse =
            CandleStickModel.fromJson(response.data);
        return Success(jsonResponse);
      } else {
        return Failure(Exception(response.statusCode));
      }
      // ignore: empty_catches
    } on DioError catch (e) {
      // final errorMessage = DioExceptions.fromDioError(e);
      return Failure(e);
    }
  }

  Future<Result<OHLCModel, Exception>> getOHLC(
      {required String pair, required String exchange}) async {
    final url =
        '${Endpoints.baseUrl[ApiType.cryptoWatch]}markets/$exchange/$pair/ohlc';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        OHLCModel jsonResponse = OHLCModel.fromJson(response.data);
        return Success(jsonResponse);
      } else {
        return Failure(Exception(response.statusCode));
      }
    } on DioError catch (e) {
      return Failure(e);
    }
  }
}
