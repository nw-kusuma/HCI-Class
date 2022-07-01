import 'package:flutter/material.dart';

import 'components/signup_screen_body.dart';

class SignupScreen 
  extends StatefulWidget {

  @override
  _SignupScreenState createState() 
      => _SignupScreenState();
}

class _SignupScreenState 
  extends State<SignupScreen> {

  static void _hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _hideKeyboard(context),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
        resizeToAvoidBottomInset: false,
        body: SignupScreenBody(),
      ),
    );
  }
}

