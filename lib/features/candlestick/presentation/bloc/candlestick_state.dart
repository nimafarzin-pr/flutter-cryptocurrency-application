import 'package:equatable/equatable.dart';

import 'candlestick_list_status.dart';
import 'candlestick_ohlc_status.dart';

class CandlestickState extends Equatable {
  final CandlestickListStatus candlestickListStatus;
  final OHLCStatus ohlcStatus;

  const CandlestickState({
    required this.candlestickListStatus,
    required this.ohlcStatus,
  });

  CandlestickState copyWith({
    CandlestickListStatus? candlestickListStatus,
    OHLCStatus? ohlcStatus,
  }) {
    return CandlestickState(
      candlestickListStatus:
          candlestickListStatus ?? this.candlestickListStatus,
      ohlcStatus: ohlcStatus ?? this.ohlcStatus,
    );
  }

  @override
  List<Object> get props => [candlestickListStatus, ohlcStatus];
}
