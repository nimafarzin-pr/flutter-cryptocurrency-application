import 'package:dio/dio.dart';

import '../../../../../core/network/constant/endpoints.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/response_model.dart';
import '../../models/coin_history_model.dart';
import '../../models/market_model.dart';

class GetHistoryDetailDS {
  final DioClient _dio;
  GetHistoryDetailDS(this._dio);

  Future<Result<CoinHistoryModel, Exception>> getHistory(
      {required String interval, required String symbolID}) async {
    final url =
        '${Endpoints.baseUrl[ApiType.coinApi]}v2/assets/$symbolID/history';
    try {
      final response = await _dio.get(
        url,
        queryParameters: {'interval': interval},
        options: Options(
            headers: {Endpoints.coinCapApiKey: Endpoints.coinCapApiKeyValue}),
      );
      if (response.statusCode == 200) {
        CoinHistoryModel jsonResponse =
            CoinHistoryModel.fromJson(response.data);

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

  Future<Result<MarketModel, Exception>> getMarkets(
      {required String symbolID}) async {
    final url =
        '${Endpoints.baseUrl[ApiType.coinApi]}v2/assets/$symbolID/markets';
    try {
      final response = await _dio.get(
        url,
        options: Options(
            headers: {Endpoints.coinCapApiKey: Endpoints.coinCapApiKeyValue}),
      );
      if (response.statusCode == 200) {
        MarketModel jsonResponse = MarketModel.fromJson(response.data);
        return Success(jsonResponse);
      } else {
        return Failure(Exception(response.statusCode));
      }
    } on DioError catch (e) {
      return Failure(e);
    }
  }
}
