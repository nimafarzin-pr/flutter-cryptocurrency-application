import 'package:equatable/equatable.dart';

import '../../data/models/coin_summary_model.dart';

abstract class CoinListStatus extends Equatable {
  const CoinListStatus();
}

class CoinsListInitial extends CoinListStatus {
  @override
  List<Object?> get props => [];
}

class CoinsListLoaded extends CoinListStatus {
  final CoinSummaryModel data;
  const CoinsListLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class CoinsListError extends CoinListStatus {
  final String message;
  const CoinsListError(this.message);

  @override
  List<Object?> get props => [message];
}
