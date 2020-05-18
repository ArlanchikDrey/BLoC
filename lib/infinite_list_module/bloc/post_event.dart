import 'package:equatable/equatable.dart';

/***
 * Our PostBloc will only respond to one event; 
 * Fetch, which will be added by the view level whenever it needs to submit more messages. 
 * Since our Fetch event is a PostEvent type, 
 * we can create a bloc/post_event.dart and implement the event as follows
 */

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends PostEvent {}