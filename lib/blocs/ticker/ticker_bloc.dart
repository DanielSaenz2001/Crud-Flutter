import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:calidad_servicioupeu/repository/ticker.dart';
part 'ticker_event.dart';
part 'ticker_state.dart';

class TickerBloc extends Bloc<TickerEvent, TickerState>{
  final Ticker _ticker;
  TickerBloc(this._ticker): super(TickerInitial());
  StreamSubscription _subscription;

  @override
  Stream<TickerState> mapEventToState(TickerEvent event) async*{
   if(event is TickerStarted){
     await _subscription?.cancel();
     _subscription=_ticker.tick().listen((tick)=>add(_TickerTicked(tick)));
   }
   if(event is _TickerTicked){
     yield TickerTickSusccess(event.tickCount);
   }
  }


  @override
  Future<void> close(){
    _subscription?.cancel();
    return super.close();
  }

}
