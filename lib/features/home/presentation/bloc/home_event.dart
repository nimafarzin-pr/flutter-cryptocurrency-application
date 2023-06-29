part of 'home_bloc.dart';

abstract class CoinsListEvent extends Equatable {
  const CoinsListEvent();

  @override
  List<Object> get props => [];
}

class GetAllCoinsEvent extends CoinsListEvent {}

class GetAllMarketsEvent extends CoinsListEvent {}
