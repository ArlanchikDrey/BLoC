import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
/**
 *Our TimerBloc should know how to handle the following events: 
  Start-notifies TimerBloc that the timer should be started.
  Pause-notifies TimerBloc that the timer should be paused.
  Resume-notifies TimerBloc that the timer should be resumed.
  Reset-tells TimerBloc that the timer should be reset to its original state.
  Tick-informs TimerBloc that a tick has occurred and that It needs to update its state accordingly.
 */
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class Start extends TimerEvent {
  final int duration;

  const Start({@required this.duration});

  @override
  String toString() => "Start { duration: $duration }";
}

class Pause extends TimerEvent {}

class Resume extends TimerEvent {}

class Reset extends TimerEvent {}

class Tick extends TimerEvent {
  final int duration;

  const Tick({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "Tick { duration: $duration }";
}

