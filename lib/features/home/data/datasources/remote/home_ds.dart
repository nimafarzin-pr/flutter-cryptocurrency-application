import 'package:dio/dio.dart';

import '../../../../../core/network/constant/endpoints.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/response_model.dart';
import '../../models/coin_summary_model.dart';
import '../../models/markets_model.dart';

class HomeDataSource {
  final DioClient _dio;
  HomeDataSource(this._dio);

  Future<Result<CoinSummaryModel, Exception>> getCoinSummaryList() async {
    final url = '${Endpoints.baseUrl[ApiType.coinApi]}v2/assets';
    try {
      final response = await _dio.get(
        url,
        options: Options(
            headers: {Endpoints.coinCapApiKey: Endpoints.coinCapApiKeyValue}),
      );
      if (response.statusCode == 200) {
        CoinSummaryModel jsonResponse =
            CoinSummaryModel.fromJson(response.data);

        return Success(jsonResponse);
      } else {
        return Failure(Exception(response.statusCode));
      }
    } on DioError catch (e) {
      return Failure(e);
    }
  }

  Future<Result<MarketsModel, Exception>> getAllMarkets() async {
    final url = '${Endpoints.baseUrl[ApiType.coinApi]}v2/markets';
    try {
      final response = await _dio.get(
        url,
        options: Options(
            headers: {Endpoints.coinCapApiKey: Endpoints.coinCapApiKeyValue}),
      );
      if (response.statusCode == 200) {
        MarketsModel jsonResponse = MarketsModel.fromJson(response.data);

        return Success(jsonResponse);
      } else {
        return Failure(Exception(response.statusCode));
      }
    } on DioError catch (e) {
      return Failure(e);
    }
  }
}
