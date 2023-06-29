import 'package:equatable/equatable.dart';

import '../../data/models/coin_history_model.dart';

abstract class ChartStatus extends Equatable {}

class ChartStatusInitial extends ChartStatus {
  @override
  List<Object?> get props => [];
}

class ChartStatusLoaded extends ChartStatus {
  final CoinHistoryModel? data;

  ChartStatusLoaded({this.data});

  @override
  List<Object?> get props => [data];
}

class ChartStatusError extends ChartStatus {
  final String message;

  ChartStatusError({required this.message});
  @override
  List<Object?> get props => [message];
}
