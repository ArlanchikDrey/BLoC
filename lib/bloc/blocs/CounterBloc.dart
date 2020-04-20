import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/bloc/events/CounterEvent.dart';

class CounterBloc extends Bloc<CounterEvent, int>{

  @override
  int get initialState => 0;

  /*
  mapEventToState function takes the incoming event as 
  an argument and must return a Stream of new states which is consumed by the presentation layer
 */
  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    switch (event) {
      case CounterEvent.DECREMENT:
        if(state > 0)
          yield state - 1;
        else
          yield state;  
        break;
      case CounterEvent.INCREMENT:
        yield state + 1;
        break;
    }
  }

}