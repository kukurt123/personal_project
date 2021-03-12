import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/models/uber_model/email-sign-in-change.model.dart';
import 'package:new_practice/utils/alert-dialog/alert-dialogs.dart';
import 'package:new_practice/utils/button/custom-button.dart';

class EmailSignInFormChange extends StatefulWidget {
  // EmailSignInFormChange({@required this.model});
  final model = Modular.get<EmailSignInChangeModel>();
  // final EmailSignInChangeModel model;

  // static Widget create(BuildContext context) {
  // final AuthService auth = context.watch<AuthService>();
  // final auth = Modular.get<AuthService>();

  // return ChangeNotifierProvider<EmailSignInChangeModel>(
  //     create: (context) => EmailSignInChangeModel(),
  //     child: EmailSignInFormChange());
  // }

  @override
  _EmailSignInFormChangeState createState() => _EmailSignInFormChangeState();
}

class _EmailSignInFormChangeState extends State<EmailSignInFormChange> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  EmailSignInChangeModel get model => widget.model;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await model.submit();
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      infoDialogUtil(context, ['Login Failed', ConvertError().message(e)]);
    }
  }

  void _toggleFormType() {
    model.toggleFormType();
    _emailController.clear();
    _passwordController.clear();
  }

  void _emailEditingComplete() {
    final focus =
        model.emailValidator.isValid(model.email) ? _passNode : _emailNode;
    FocusScope.of(context).requestFocus(focus);
  }

  List<Widget> _buildChildren() {
    return [
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      _buildPassTextField(),
      SizedBox(height: 8.0),
      FormSubmitButton(
          text: model.primaryButtonText,
          onPressed: model.isButtonSubmitEnabled ? () => _submit() : null),
      SizedBox(height: 8.0),
      FlatButton(
        child: Text(model.secondaryButtonText),
        onPressed: !model.isLoading ? () => _toggleFormType() : null,
      )
    ];
  }

  TextField _buildEmailTextField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
          errorText: model.emailErrorText,
          enabled: !model.isLoading),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: model.updateEmail,
      textInputAction: TextInputAction.next,
      focusNode: _emailNode,
      onEditingComplete: () => _emailEditingComplete(),
    );
  }

  TextField _buildPassTextField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: '...',
          errorText: model.passwordErrorText,
          enabled: !model.isLoading),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: model.updatePassword,
      focusNode: _passNode,
      onEditingComplete: _submit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: StreamBuilder(
          stream: model.update.stream,
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: _buildChildren(),
            );
          }),
    );
  }
}
