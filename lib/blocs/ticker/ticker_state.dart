part of 'ticker_bloc.dart';

abstract class TickerState extends Equatable{
  const TickerState();

  @override
  List<Object> get props=>[];
}

class TickerInitial extends TickerState{}

class TickerTickSusccess extends TickerState{
  final int count;
  const TickerTickSusccess(this.count);
  @override
  List<Object> get props=>[count];
}