//All our Ticker class does is provide a tick function that takes the desired number 
//of ticks (seconds) 
//and returns a stream that generates the remaining seconds every second.
class Ticker {
  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}