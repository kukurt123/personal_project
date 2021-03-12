import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:new_practice/utils/textfield/string-validator.dart';
import 'package:rxdart/subjects.dart';

import 'enums/form-type.enum.dart';

class EmailSignInChangeModel with EmailAndPasswordValidators {
  EmailSignInChangeModel({
    // @required this.auth,
    this.email = '',
    this.password = '',
    this.formType = FormType.signIn,
    this.isLoading = false,
    this.submitted = false,
  });

  // final AuthService auth;
  final auth = Modular.get<AuthService>();
  String email;
  String password;
  FormType formType;
  bool isLoading;
  bool submitted;
  final update = BehaviorSubject<bool>.seeded(false);

  String get primaryButtonText {
    return formType == FormType.signIn ? 'Sign In' : 'Sign Up';
  }

  String get secondaryButtonText {
    return formType == FormType.signIn
        ? 'Need an account? Sign up'
        : 'Have an account? Sign in';
  }

  bool get isButtonSubmitEnabled {
    return emailValidator.isValid(email) &&
        emailValidator.isValid(password) &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        !isLoading;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(password);
    return showErrorText ? invalidPasswordlErrorText : null;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidPasswordlErrorText : null;
  }

  void toggleFormType() {
    final form =
        this.formType == FormType.signIn ? FormType.signUp : FormType.signIn;
    updateWith(
      email: '',
      password: '',
      formType: form,
      isLoading: false,
      submitted: false,
    );
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      if (formType == FormType.signIn) {
        await auth.signInWithEmail(email, password);
      } else {
        await auth.signUpWithEmail(email, password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
    FormType formType,
    bool isLoading,
    bool submitted,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.formType = formType ?? this.formType;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;
    update.add(!update.value);
  }
}
