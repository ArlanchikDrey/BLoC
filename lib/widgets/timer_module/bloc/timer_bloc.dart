import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/widgets/timer_module/bloc/timer_event.dart';
import 'package:bloc_pattern/widgets/timer_module/bloc/timer_state.dart';
import 'package:bloc_pattern/widgets/timer_module/ticker.dart';
import 'package:meta/meta.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  final int _duration = 60;

  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker;

  //In this case, we want TimerBloc to start in the Ready state with a specified duration of 1 minute (60 seconds).
  @override
  TimerState get initialState => Ready(_duration); // TODO: implement initialState;

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is Start) {
      yield* _mapStartToState(event);
    }else if (event is Pause) {
      yield* _mapPauseToState(event);
    }else if (event is Resume) {
      yield* _mapResumeToState(event);
    }else if (event is Reset) {
      yield* _mapResetToState(event);
    }else if (event is Tick) {
      yield* _mapTickToState(event);
    }
  }

  /***
   * If TimerBloc receives the Start event, 
   * It converts the state to Running with the original duration. 
   * Also, if there was already an open _tickerSubscription, we need to cancel it to free up memory. 
   * We also need to redefine our TimerBloc's close method so that we can cancel _tickerSubscription 
   * when TimerBloc is closed. Finally, we listen to the _ticker.tick stream and on each tick 
   * we add a Tick event with the remaining duration.
   */
  Stream<TimerState> _mapStartToState(Start start) async* {
     yield Running(start.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: start.duration)
        .listen((duration) => add(Tick(duration: duration)));
  }

  /***
   * Every time a Tick event is received, 
   * if the tick duration is greater than 0, 
   * we need to set the updated Running state with a new duration. 
   * Otherwise, if the tick duration is 0, our timer has ended and we need to go to the Finished state.
   */
  Stream<TimerState> _mapTickToState(Tick tick) async* {
    yield tick.duration > 0 ? Running(tick.duration) : Finished();
  }

  /***
   * In _mapPauseToState, 
   * if the state of our TimerBloc is Running, 
   * then we can pause _tickerSubscription and 
   * set the Paused state with the current timer duration.
   */
  Stream<TimerState> _mapPauseToState(Pause pause) async* {
    if (state is Running) {
      _tickerSubscription?.pause();
      yield Paused(state.duration);
    }
  }

  /**
   * The Resume event handler is very similar to the Pause event handler. 
   * If TimerBloc has state Paused and it receives the Resume event, 
   * it resumes _tickerSubscription and sets the Running state with the current duration.
   */
  Stream<TimerState> _mapResumeToState(Resume resume) async* {
    if (state is Paused) {
      _tickerSubscription?.resume();
      yield Running(state.duration);
    }
  }

  /***
   * If TimerBloc receives a Reset event, it needs to cancel the current _tickerSubscription 
   * so that It is not notified of any additional ticks and set the Ready s
   */
  Stream<TimerState> _mapResetToState(Reset reset) async* {
    _tickerSubscription?.cancel();
    yield Ready(_duration);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}