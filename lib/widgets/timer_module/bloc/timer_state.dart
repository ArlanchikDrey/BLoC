import 'package:equatable/equatable.dart';

/**
 * Note that all TimerStates extend the abstract base class TimerState, 
 * which has a duration property. 
 * This is because no matter what state our TimerBloc is in, we want to know how much time is left.
 */

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

/**
 *each of these States will affect what the user sees. For example:
  if the state is Ready, the user can start the timer.
  if the state is Running, the user can pause or reset the timer, and see the remaining duration.
  if the state is Paused, the user can resume or reset the timer.
  if the state is Finished, the user can reset the timer.
 */
class Ready extends TimerState {
  const Ready(int duration) : super(duration);

  @override
  String toString() => 'Ready { duration: $duration }';
}

class Paused extends TimerState {
  const Paused(int duration) : super(duration);

  @override
  String toString() => 'Paused { duration: $duration }';
}

class Running extends TimerState {
  const Running(int duration) : super(duration);

  @override
  String toString() => 'Running { duration: $duration }';
}

class Finished extends TimerState {
  const Finished() : super(0);
}