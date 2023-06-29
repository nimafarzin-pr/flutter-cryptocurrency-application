import 'features/candlestick/data/datasources/remote/candlestick_ds.dart';
import 'features/candlestick/data/repositories/candlestick_repo_impl.dart';
import 'features/candlestick/domain/repositories/candlestick_repo.dart';
import 'features/candlestick/domain/usecases/candlestick_uc.dart';

import 'core/network/dio_client.dart';
import 'features/home/data/datasources/remote/home_ds.dart';
import 'features/home/data/repositories/home_repo_impl.dart';
import 'features/home/domain/repositories/home_repo.dart';
import 'features/home/domain/usecases/home_uc.dart';
import 'features/history/data/repositories/hostory_repo_impl.dart';
import 'features/history/domain/repositories/history_repo.dart';
import 'features/history/domain/usecases/history_uc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/history/data/datasources/remote/history_data_source.dart';

final serviceLocator = GetIt.instance;
Future<void> setUpServiceLocator() async {
  final dio = Dio();

  /// Home
  //Coins List
  serviceLocator
    ..registerSingleton<Dio>(dio)
    ..registerSingleton<DioClient>(DioClient(serviceLocator()))
    ..registerSingleton<HomeDataSource>(HomeDataSource(serviceLocator()))
    ..registerSingleton<HomeRepository>(HomeRepositoryImpl(serviceLocator()))
    ..registerSingleton<HomeUseCase>(HomeUseCase(serviceLocator()));
  //Coins History
  serviceLocator
    ..registerSingleton<GetHistoryDetailDS>(
        GetHistoryDetailDS(serviceLocator()))
    ..registerSingleton<HistoryRepo>(HistoryRepoImpl(serviceLocator()))
    ..registerSingleton<HistoryUC>(HistoryUC(serviceLocator()));

  ///CandleStick
  serviceLocator
    ..registerSingleton<CandleStickDataSource>(
        CandleStickDataSource(serviceLocator()))
    ..registerSingleton<CandleStickRepository>(
        CandleStickRepositoryImpl(serviceLocator()))
    ..registerSingleton<CandleStickUseCase>(
        CandleStickUseCase(serviceLocator()));
}
