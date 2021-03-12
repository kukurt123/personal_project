import 'package:new_practice/models/food.dart';
import 'package:rxdart/rxdart.dart';

class Page1_3rx {
  final pood = new BehaviorSubject<Food>();

  openDetails({Food food}) {
    pood.sink.add(food);
  }

  edit(Food food) {
    pood.add(food);
  }

  // add() {
  //   print('adding');
  //   count.sink.add(count.value == null ? 1 : count.value + 1);
  // }

  // subtract() {
  //   print('subtracting');
  //   count.sink.add(count.value == null ? 1 : count.value - 1);
  // }
}
