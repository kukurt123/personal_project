import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_practice/models/uber_model/users.dart';
import 'package:rxdart/subjects.dart';

abstract class AuthBase {
  Stream<Users> get onAuthStateChanged;

  Future<Users> currentUser();

  Future<Users> anonymousLogin();

  Future<void> signOut();

  Future<Users> signInWithGoogle();

  Future<Users> signInWithFacebook();

  Future<Users> signInWithEmail(String email, String pass);

  Future<Users> signUpWithEmail(String email, String pass);
}

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  BehaviorSubject<bool> isLoading = BehaviorSubject<bool>();

  checkChanges() {
    onAuthStateChanged.listen((x) {
      print('listeneders..');
      isLoading.sink.add(false);
    }, onError: (err) {
      print('errorers..');
      isLoading.add(false);
    }, onDone: () {
      print('done');
    });
  }

  Users _userFromFirebase(User user) {
    if (user == null) return null;
    return Users(
        uid: user.uid, displayName: user.displayName, photoUrl: user.photoURL);
  }

  // @override
  Stream<Users> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges.call().map(_userFromFirebase);
  }

  // @override
  Future<Users> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  String getCurrentUserId() {
    final user = _firebaseAuth.currentUser;
    return user.uid;
  }

  // @override
  Future<Users> anonymousLogin() async {
    final auth = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(auth.user);
  }

  // @override
  Future<Users> signInWithEmail(String email, String pass) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pass);
    return _userFromFirebase(authResult.user);
  }

  // @override
  Future<Users> signUpWithEmail(String email, String pass) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pass);
    return _userFromFirebase(authResult.user);
  }

  // @override
  Future<Users> signInWithFacebook() async {
    final facebookLogin = FacebookLogin();
    var result = await facebookLogin.logInWithReadPermissions(
      ['public_profile'],
    );
    if (result.accessToken == null) {
      print('== null');
      facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
      result = await facebookLogin.logInWithReadPermissions(
        ['public_profile'],
      );
    }

    print(result.status);

    if (result.accessToken != null) {
      final authResult = await _firebaseAuth.signInWithCredential(
        FacebookAuthProvider.credential(
          result.accessToken.token,
        ),
      );
      print('result..... ${authResult.user}');
      return _userFromFirebase(authResult.user);
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  // @override
  Future<Users> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    print('1');
    final googleSignInAccount = await googleSignIn.signIn();
    print('2');
    if (googleSignInAccount != null) {
      final googleAuth = await googleSignInAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'Missing Google Auth Token');
      }
    } else {
      throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
    }
  }

  // @override
  Future<void> signOut() async {
    // User user = _firebaseAuth.currentUser;
    List<UserInfo> userInfo = _firebaseAuth.currentUser.providerData;
    print(' user.providerData.....');
    // print('starting....' + user.toString());
    userInfo.map((x) async {
      if (x.providerId == GoogleAuthProvider.PROVIDER_ID) {
        final googleSignIn = GoogleSignIn();
        await googleSignIn.signOut();
      }
      if (x.providerId == FacebookAuthProvider.PROVIDER_ID) {
        final facebookLogin = FacebookLogin();
        await facebookLogin.logOut();
      }
      await _firebaseAuth.signOut();
    });

    await _firebaseAuth.signOut();
    print('Auth Sign Out done');
  }
}
