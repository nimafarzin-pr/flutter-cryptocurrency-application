part of 'home_bloc.dart';

class HomeState extends Equatable {
  final CoinListStatus coinListStatus;
  final MarketsStatus marketsStatus;
  const HomeState({
    required this.coinListStatus,
    required this.marketsStatus,
  });

  @override
  List<Object?> get props => [coinListStatus, marketsStatus];

  HomeState copyWith(
      {CoinListStatus? coinListStatus, MarketsStatus? marketsStatus}) {
    return HomeState(
      coinListStatus: coinListStatus ?? this.coinListStatus,
      marketsStatus: marketsStatus ?? this.marketsStatus,
    );
  }
}
