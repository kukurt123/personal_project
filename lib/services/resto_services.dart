import 'package:new_practice/mock_data/restaurant_data.dart';

List<String> getRestos(String query) {
  List<String> matches = <String>[];
  currentUser.orders.map((z) {
    print(z.restaurant.toString());
    matches.add(z.restaurant.toString());
  });
  // matches.addAll(currentUser.orders.);

  matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
  return matches;
}
