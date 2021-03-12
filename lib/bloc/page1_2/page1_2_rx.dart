import 'package:rxdart/rxdart.dart';

class Page1_2rx {
  final count = new BehaviorSubject<int>();

  int getCount() => count.stream.value;
  getCounts() => count.stream.shareValue();

  add() {
    print('adding');
    count.sink.add(count.value == null ? 1 : count.value + 1);
  }

  subtract() {
    print('subtracting');
    count.sink.add(count.value == null ? 1 : count.value - 1);
  }
}
