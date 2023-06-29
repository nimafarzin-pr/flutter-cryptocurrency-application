part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class GetHistory extends HistoryEvent {
  final String interval;
  final String symbolId;

  const GetHistory({required this.interval, required this.symbolId});

  @override
  List<Object> get props => [interval, symbolId];
}

class GetMarkets extends HistoryEvent {
  final String symbolId;

  const GetMarkets({required this.symbolId});

  @override
  List<Object> get props => [symbolId];
}
