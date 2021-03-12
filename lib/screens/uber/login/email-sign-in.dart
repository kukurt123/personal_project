import 'package:flutter/material.dart';
import 'email-sign-in-form-change.dart';

class EmailSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: EmailSignInFormChange(),
              ))),
      backgroundColor: Colors.grey[200],
    );
  }
}
