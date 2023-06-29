import 'package:bloc/bloc.dart';
import '../../domain/usecases/candlestick_uc.dart';
import 'candlestick_state.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/response_model.dart';
import '../../../../injector.dart';
import 'candlestick_list_status.dart';
import 'candlestick_ohlc_status.dart';

part 'candlestick_event.dart';

class CandlestickBloc extends Bloc<CandlestickEvent, CandlestickState> {
  final req = serviceLocator<CandleStickUseCase>();

  CandlestickBloc()
      : super(CandlestickState(
          candlestickListStatus: CandlestickListInitial(),
          ohlcStatus: OHLCInitial(),
        )) {
    on<GetCandleStickMarkets>((event, emit) async {
      emit(state.copyWith(candlestickListStatus: CandlestickListInitial()));
      final result = await req.getCandleStickMarkets();
      emit(switch (result) {
        Success(data: final data) => state.copyWith(
            candlestickListStatus: CandlestickListLoaded(data: data)),
        Failure(exception: final exception) => state.copyWith(
            candlestickListStatus: CandlestickListError(
                message: 'Something went wrong: $exception')),
      });
    });

    on<GetOHLCData>((event, emit) async {
      emit(state.copyWith(ohlcStatus: OHLCInitial()));
      final result =
          await req.getOHLC(exchange: event.exchange, pair: event.pair);
      emit(switch (result) {
        Success(data: final data) =>
          state.copyWith(ohlcStatus: OHLCLoaded(data: data)),
        Failure(exception: final exception) => state.copyWith(
            ohlcStatus: OHLCError(message: 'Something went wrong: $exception')),
      });
    });
  }
}
