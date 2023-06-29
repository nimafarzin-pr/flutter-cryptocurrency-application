part of 'candlestick_bloc.dart';

abstract class CandlestickEvent extends Equatable {
  const CandlestickEvent();

  @override
  List<Object> get props => [];
}

class GetCandleStickMarkets extends CandlestickEvent {}

class GetOHLCData extends CandlestickEvent {
  final String exchange;
  final String pair;

  const GetOHLCData({required this.exchange, required this.pair});

  @override
  List<Object> get props => [exchange, pair];
}
