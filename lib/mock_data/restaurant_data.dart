import 'package:new_practice/models/food.dart';
import 'package:new_practice/models/order.dart';
import 'package:new_practice/models/restaurant.dart';
import 'package:new_practice/models/user.dart';

final _carbonara = Food(
    imageUrl: 'assets/images/carbonara.jpg', name: 'Carbonara', price: 500.00);
final _chickenjoy = Food(
    imageUrl: 'assets/images/chickenjoy.png',
    name: 'Chickenjoy',
    price: 390.00);
final _pasta =
    Food(imageUrl: 'assets/images/pasta.jpg', name: 'Pasta', price: 230.00);
final _pie =
    Food(imageUrl: 'assets/images/pie.jpg', name: 'Pie', price: 260.00);
final _salmon =
    Food(imageUrl: 'assets/images/salmon.jpg', name: 'Salmon', price: 980.00);
final _tokwa =
    Food(imageUrl: 'assets/images/tokwa.jpg', name: 'Tokwa', price: 210.00);

final _restaurant0 = Restaurant(
    imageUrl: 'assets/images/resto4.jpg',
    name: 'Pollo Loco',
    address: '200 Main St, New York, NY',
    rating: 5,
    menu: [_carbonara, _chickenjoy, _pasta, _pie, _salmon, _tokwa]);

final _restaurant1 = Restaurant(
    imageUrl: 'assets/images/resto1.jpg',
    name: 'Jamies',
    address: '200 Main St, New York, NY',
    rating: 3,
    menu: [_carbonara, _salmon, _tokwa]);

final _restaurant2 = Restaurant(
    imageUrl: 'assets/images/resto2.jpg',
    name: 'Ruby Tuesday',
    address: '200 Main St, New York, NY',
    rating: 3,
    menu: [_carbonara, _tokwa]);

final _restaurant3 = Restaurant(
    imageUrl: 'assets/images/resto3.jpg',
    name: 'Jaggers',
    address: '200 Main St, New York, NY',
    rating: 5,
    menu: [
      _carbonara,
      _chickenjoy,
      _pasta,
    ]);

final _restaurant4 = Restaurant(
    imageUrl: 'assets/images/resto5.jpg',
    name: 'Bojangles',
    address: '200 Main St, New York, NY',
    rating: 4,
    menu: [_pie, _salmon, _tokwa]);

final List<Restaurant> restaurants = [
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4
];

final currentUser = User(name: 'Kurt', orders: [
  Order(
      date: 'Nov 8, 2019',
      food: _carbonara,
      restaurant: _restaurant0,
      quantity: 1),
  Order(
      date: 'Nov 8, 2019', food: _pasta, restaurant: _restaurant0, quantity: 1),
  Order(
      date: 'Nov 8, 2019',
      food: _chickenjoy,
      restaurant: _restaurant0,
      quantity: 1),
  Order(
      date: 'Nov 1, 2019',
      food: _salmon,
      restaurant: _restaurant4,
      quantity: 2),
], cart: [
  Order(
      date: 'Nov 10, 2019',
      food: _carbonara,
      restaurant: _restaurant0,
      quantity: 1),
  Order(
      date: 'Nov 10, 2019',
      food: _pasta,
      restaurant: _restaurant0,
      quantity: 1),
  Order(
      date: 'Nov 10, 2019',
      food: _chickenjoy,
      restaurant: _restaurant0,
      quantity: 1),
  Order(
      date: 'Nov 8, 2019',
      food: _carbonara,
      restaurant: _restaurant0,
      quantity: 1),
  Order(
      date: 'Nov 8, 2019', food: _pasta, restaurant: _restaurant0, quantity: 1),
  Order(
      date: 'Nov 8, 2019',
      food: _chickenjoy,
      restaurant: _restaurant0,
      quantity: 1),
  Order(
      date: 'Nov 1, 2019',
      food: _salmon,
      restaurant: _restaurant4,
      quantity: 2),
]);
