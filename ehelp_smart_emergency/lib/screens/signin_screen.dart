import 'package:flutter/material.dart';

import 'components/signin_screen_body.dart';

class SigninScreen 
  extends StatefulWidget {

  @override
  State<SigninScreen> createState() 
      => _SigninScreenState();
}

class _SigninScreenState 
  extends State<SigninScreen> {
    
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
        body: SigninScreenBody(),
      ),
    );
  }
}

