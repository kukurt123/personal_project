import 'package:new_practice/models/qr/requestqr.dart';
import 'package:new_practice/models/social_media/socialuser.dart';
import 'package:rxdart/rxdart.dart';

class QrBloc {
  bool isLoaded = false;
  final requestQr = new BehaviorSubject<RequestQr>();
  String id = '';
  bool done = false;

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
}
