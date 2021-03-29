import 'package:new_practice/models/ecommerce/fruit.dart';
import 'package:new_practice/models/ecommerce/fruit_total.dart';
import 'package:new_practice/models/qr/requestqr.dart';
import 'package:new_practice/models/social_media/socialuser.dart';
import 'package:rxdart/rxdart.dart';

class ChatBloc {
  bool isLoaded = false;
  final cart = List<Fruit>();
  final cartGrouped = List<FruitTotal>();
  final fruitListStream = BehaviorSubject<bool>.seeded(false);
  String id = '';
  bool done = false;
  String heroTag = '';

  changefruitListStrem() {
    fruitListStream.add(!fruitListStream.value);
  }

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
          qty: fruitTotal.qty + fruit.fruitQty,
          totalPrice: fruitTotal.totalPrice + fruit.price);
      cartGrouped[cartGrouped.indexWhere((x) => x.totalId == fruit.id)] =
          fruitTotal;
    } else {
      final total = FruitTotal(
          totalId: fruit.id,
          imageLocation: fruit.image,
          totalName: fruit.name,
          qty: fruit.fruitQty,
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
