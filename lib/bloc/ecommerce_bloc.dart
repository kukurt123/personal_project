import 'package:new_practice/models/ecommerce/fruit.dart';
import 'package:new_practice/models/ecommerce/fruit_total.dart';
import 'package:new_practice/models/qr/requestqr.dart';
import 'package:new_practice/models/social_media/socialuser.dart';
import 'package:rxdart/rxdart.dart';

class EcommerceBloc {
  bool isLoaded = false;
  final cart = List<Fruit>();
  final cartGrouped = List<FruitTotal>();
  final fruitListStream = BehaviorSubject<bool>.seeded(false);
  String id = '';
  bool done = false;

  changefruitListStrem() {
    fruitListStream.add(!fruitListStream.value);
  }

  // changeUser({SocialUser user}) {
  //   currentUser.sink.add(user);
  // }

  // edit(SocialUser user) {
  //   currentUser.add(user);
  // }

  // add() {
  //   print('adding');
  //   count.sink.add(count.value == null ? 1 : count.value + 1);
  // }

  // subtract() {
  //   print('subtracting');
  //   count.sink.add(count.value == null ? 1 : count.value - 1);
  // }

  addOnFruits(Fruit fruit) {
    cart.add(fruit);
    changefruitListStrem();
  }

  removeOnFruits(Fruit fruit) {
    cart.removeAt(int.parse(fruit.id) - 1);
    changefruitListStrem();
  }

  addCartGrouped(Fruit fruit) {
    FruitTotal fruitTotal;
    if (cartGrouped.any((fru) {
          fruitTotal = fru;
          return fru.totalId == fruit.id;
        }) &&
        cartGrouped.isNotEmpty) {
      fruitTotal = FruitTotal(
          totalId: fruitTotal.totalId,
          imageLocation: fruitTotal.imageLocation,
          totalName: fruitTotal.totalName,
          qty: fruitTotal.qty + 1,
          totalPrice: fruitTotal.totalPrice + fruit.price);
      cartGrouped[cartGrouped.indexWhere((x) => x.totalId == fruit.id)] =
          fruitTotal;
    } else {
      final total = FruitTotal(
          totalId: fruit.id,
          imageLocation: fruit.image,
          totalName: fruit.name,
          qty: 1,
          totalPrice: fruit.price);
      cartGrouped.add(total);
    }
    changefruitListStrem();
  }

  removeCartGrouped(FruitTotal fruitTotal) {
    cartGrouped.remove(fruitTotal);
    changefruitListStrem();
  }
}
