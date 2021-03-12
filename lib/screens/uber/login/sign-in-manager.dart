import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/models/uber_model/users.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:rxdart/rxdart.dart';

class SignInManager {
  final auth = Modular.get<AuthService>();
  BehaviorSubject<bool> isLoading = new BehaviorSubject<bool>();

  setIsLoading(bool value) {
    isLoading.sink.add(value);
  }

  // setAuth(AuthService value) {
  //   auth.sink.add(value);
  // }

  Future<Users> _signIn(Future<Users> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<Users> anonymousLogin() async {
    // print('auth//....' + (auth.value == null).toString());
    await _signIn(auth.anonymousLogin);
  }

  Future<Users> signInWithGoogle() async {
    // print('auth//....' + (auth.value == null).toString());
    await _signIn(auth.signInWithGoogle);
  }

  Future<Users> signInWithFacebook() async =>
      await _signIn(auth.signInWithFacebook);
}
