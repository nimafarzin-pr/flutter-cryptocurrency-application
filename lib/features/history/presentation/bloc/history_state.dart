// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_status/features/history/presentation/bloc/chart_status.dart';
import 'package:coin_status/features/history/presentation/bloc/market_status.dart';
import 'package:equatable/equatable.dart';

class HistoryState extends Equatable {
  final ChartStatus chartStatus;
  final MarketStatus marketStatus;
  const HistoryState({
    required this.chartStatus,
    required this.marketStatus,
  });

  HistoryState copyWith(
      {ChartStatus? chartStatus, MarketStatus? marketStatus}) {
    return HistoryState(
        chartStatus: chartStatus ?? this.chartStatus,
        marketStatus: marketStatus ?? this.marketStatus);
  }

  @override
  List<Object> get props => [chartStatus, marketStatus];
}
