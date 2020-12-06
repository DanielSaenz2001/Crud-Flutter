part of 'ticker_bloc.dart';

abstract class TickerEvent extends Equatable{
  const TickerEvent();

  @override
  List<Object> get props=>[];

}

class TickerStarted extends TickerEvent{}

class _TickerTicked extends TickerEvent{
final int tickCount;
const _TickerTicked(this.tickCount);
@override
List<Object> get props=>[tickCount];
}