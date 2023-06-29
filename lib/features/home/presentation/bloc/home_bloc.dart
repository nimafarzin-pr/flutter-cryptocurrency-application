import 'package:bloc/bloc.dart';
import '../../domain/usecases/home_uc.dart';
import '../../../../injector.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/response_model.dart';
import 'coin_list_status.dart';
import 'markets_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<CoinsListEvent, HomeState> {
  final req = serviceLocator<HomeUseCase>();
  HomeBloc()
      : super(
          HomeState(
              coinListStatus: CoinsListInitial(),
              marketsStatus: MarketsListInitial()),
        ) {
    on<GetAllCoinsEvent>((event, emit) async {
      emit(state.copyWith(coinListStatus: CoinsListInitial()));
      final result = await req.getCoinSummaryList();
      emit(switch (result) {
        Success(data: final data) =>
          state.copyWith(coinListStatus: CoinsListLoaded(data)),
        Failure(exception: final exception) => state.copyWith(
            coinListStatus: CoinsListError('Something went wrong: $exception'),
          ),
      });
    });

    on<GetAllMarketsEvent>((event, emit) async {
      emit(state.copyWith(marketsStatus: MarketsListInitial()));
      final result = await req.getAllMarkets();
      emit(switch (result) {
        Success(data: final data) =>
          state.copyWith(marketsStatus: MarketsListLoaded(data)),
        Failure(exception: final exception) => state.copyWith(
            marketsStatus: MarketsListError('Something went wrong: $exception'),
          ),
      });
    });
  }
}
