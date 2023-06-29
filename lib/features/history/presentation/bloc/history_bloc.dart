import 'package:bloc/bloc.dart';
import '../../domain/usecases/history_uc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/response_model.dart';
import '../../../../injector.dart';
import 'chart_status.dart';
import 'history_state.dart';
import 'market_status.dart';

part 'history_event.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final req = serviceLocator<HistoryUC>();

  HistoryBloc()
      : super(HistoryState(
          chartStatus: ChartStatusInitial(),
          marketStatus: MarketStatusInitial(),
        )) {
    on<GetHistory>((event, emit) async {
      emit(state.copyWith(chartStatus: ChartStatusInitial()));
      final result = await req.getHistory(
          interval: event.interval, symbolID: event.symbolId);
      emit(switch (result) {
        Success(data: final data) =>
          state.copyWith(chartStatus: ChartStatusLoaded(data: data)),
        Failure(exception: final exception) => state.copyWith(
            chartStatus:
                ChartStatusError(message: 'Something went wrong: $exception')),
      });
    });

    on<GetMarkets>((event, emit) async {
      emit(state.copyWith(marketStatus: MarketStatusInitial()));
      final result = await req.getMarket(symbolID: event.symbolId);
      emit(switch (result) {
        Success(data: final data) =>
          state.copyWith(marketStatus: MarketStatusLoaded(data: data)),
        Failure(exception: final exception) => state.copyWith(
            marketStatus:
                MarketStatusError(message: 'Something went wrong: $exception')),
      });
    });
  }
}
