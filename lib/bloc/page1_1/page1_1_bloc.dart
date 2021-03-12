import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:new_practice/repo/page1_1_repo.dart';

import 'page1_1_barrel.dart';

class Page1Bloc extends Bloc<Page1Event, Page1State> {
  // final controller = StreamController();
  Page1Bloc({Page1Repository repo})
      : _page1repository = repo,
        super(Page1State.loading());
  static const _delay = Duration(milliseconds: 300);
  Future<void> wait() => Future.delayed(_delay);

  final Page1Repository _page1repository;

  @override
  Page1State get initialState => Page1State.loading();

  @override
  Stream<Page1State> mapEventToState(Page1Event event) async* {
    if (event is Page1EventSummary) {
      yield Page1State.loading();
      try {
        this._getNames();
        yield Page1State.calculate();
        print('yes! working ang page1bloc!');
      } catch (_) {
        print('error tana ya....');
        yield Page1State.error();
      }
    } else if (event is Page1EventClicked) {
      yield Page1State.calculate();
      print('clicked!!!!');
    } else if (event is Page1EventWaitTest) {
      yield Page1State.calculate();
    } else {
      yield Page1State.error();
    }
    // TODO: implement mapEventToState
  }

  Stream<Page1State> _getNames() async* {
    final names = await _page1repository.fetchNames();
    for (var name in names) {
      print('var name in names');
      print(name);
    }
  }
}
