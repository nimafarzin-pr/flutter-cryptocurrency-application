import '../../../../core/network/response_model.dart';
import '../datasources/remote/home_ds.dart';
import '../models/coin_summary_model.dart';
import '../models/markets_model.dart';
import '../../domain/repositories/home_repo.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;
  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Result<CoinSummaryModel, Exception>> getCoinSummaryList() async {
    return await dataSource.getCoinSummaryList();
  }

  @override
  Future<Result<MarketsModel, Exception>> getAllMarkets() async {
    return await dataSource.getAllMarkets();
  }
}
