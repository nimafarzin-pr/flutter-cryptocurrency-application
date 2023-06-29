import '../../data/models/market_model.dart';
import 'package:equatable/equatable.dart';

abstract class MarketStatus extends Equatable {}

class MarketStatusInitial extends MarketStatus {
  @override
  List<Object?> get props => [];
}

class MarketStatusLoaded extends MarketStatus {
  final MarketModel data;

  MarketStatusLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class MarketStatusError extends MarketStatus {
  final String message;

  MarketStatusError({required this.message});
  @override
  List<Object?> get props => [message];
}
