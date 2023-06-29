import 'package:equatable/equatable.dart';

import '../../data/models/candlestick_model.dart';

abstract class CandlestickListStatus extends Equatable {
  const CandlestickListStatus();

  @override
  List<Object> get props => [];
}

class CandlestickListInitial extends CandlestickListStatus {}

class CandlestickListLoaded extends CandlestickListStatus {
  final CandleStickModel data;
  const CandlestickListLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class CandlestickListError extends CandlestickListStatus {
  final String message;
  const CandlestickListError({required this.message});

  @override
  List<Object> get props => [message];
}
