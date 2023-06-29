import 'package:equatable/equatable.dart';

import '../../data/models/ohlc_model.dart';

abstract class OHLCStatus extends Equatable {
  const OHLCStatus();

  @override
  List<Object> get props => [];
}

class OHLCInitial extends OHLCStatus {}

class OHLCLoaded extends OHLCStatus {
  final OHLCModel data;
  const OHLCLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class OHLCError extends OHLCStatus {
  final String message;
  const OHLCError({required this.message});

  @override
  List<Object> get props => [message];
}
