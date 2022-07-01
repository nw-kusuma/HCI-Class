import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/signin_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(245, 245, 245, 1.0),
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  ); runApp(EHELP());
}

class EHELP 
  extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "eHelp Smart Emergency",
      theme: ThemeData(primarySwatch: Colors.red),
      home: SigninScreen(),
    );
  }
}