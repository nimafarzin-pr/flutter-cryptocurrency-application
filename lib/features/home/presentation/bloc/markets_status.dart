import 'package:equatable/equatable.dart';

import '../../data/models/markets_model.dart';

abstract class MarketsStatus extends Equatable {
  const MarketsStatus();
}

class MarketsListInitial extends MarketsStatus {
  @override
  List<Object?> get props => [];
}

class MarketsListLoaded extends MarketsStatus {
  final MarketsModel data;
  const MarketsListLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class MarketsListError extends MarketsStatus {
  final String message;
  const MarketsListError(this.message);

  @override
  List<Object?> get props => [message];
}
