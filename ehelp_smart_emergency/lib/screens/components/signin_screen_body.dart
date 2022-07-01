import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/positioned_custom_painter.dart';
import '../signup_screen.dart';
import '../otp_screen.dart';

class SigninScreenBody 
  extends StatefulWidget {

  @override
  _SigninScreenBodyState createState() 
      => _SigninScreenBodyState();
}

class _SigninScreenBodyState 
  extends State<SigninScreenBody> {
    final _uidController = TextEditingController();
    final _pwdController = TextEditingController();
    bool _isObscured = true;

    double _hCentered(width){
      var deviceWidth = MediaQuery.of(context).size.width;
      return ((deviceWidth / 2) - ((deviceWidth * width) / 2));
    }

    final _regex = RegExp(r"^(0?[7-9][1-9]{2}([0-9]{7,8}))$");
    bool _isValidated(){
      if (_uidController.text.isNotEmpty && _regex.hasMatch(_uidController.text) &&
          _pwdController.text.isNotEmpty && _pwdController.text.length >= 8){
        return true;
      } return false;
    }

  @override
  void initState() {
    _uidController.addListener(() => setState(() {}));
    _pwdController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _uidController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: _height * 0.4,
              width: _width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/bg-map-01.png")),
                color: Colors.red.shade900,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(_height * 0.025),
                  bottomLeft: Radius.circular(_height * 0.025),
              ),),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: _height * 0.06),
                  child: Image.asset("assets/images/eHelp-logo-squared-new.png",
                    filterQuality: FilterQuality.medium,
                    width: _height * 0.18,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: _height * 0.275,
          left: _hCentered(0.85),
          // left: _width * 0.075,
          child: SizedBox(
            child: CustomPaint(
              size: Size(_width * 0.85, _height * 0.35),
              painter: PositionedCustomPainter(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: _height * 0.29, 
            left: _width * 0.12,
            right: _width * 0.12),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.userLock, 
                    size: _height * 0.02,
                    color: Colors.red.shade900),
                  SizedBox(width: _height * 0.02),
                  Text("Welcome back..", 
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: _height * 0.022,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.red.shade900),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _height * 0.008),
                child: Column(
                children: [
                  TextFormField(
                    controller: _uidController,
                    onChanged: (value){},
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Phone',
                      // labelStyle: TextStyle(color: Colors.red.shade900),
                      floatingLabelStyle: TextStyle(fontSize: _height * 0.025),
                      suffixIcon: _uidController.text.isEmpty
                        ? Icon(Icons.phone_enabled_rounded)
                        : InkWell(child: Icon(Icons.close),
                            onTap: () => _uidController.clear())
                  ),),
                  SizedBox(height: _height * 0.01),
                  TextFormField(
                    controller: _pwdController,
                    onChanged: (value){},
                    obscureText: _isObscured ? true : false,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Password',
                      // labelStyle: TextStyle(color: Colors.red.shade900),
                      floatingLabelStyle: TextStyle(fontSize: _height * 0.025),
                      suffixIcon: _pwdController.text.isEmpty 
                        ? Icon(Icons.lock_outline)
                        : _isObscured 
                        ? InkWell(child: Icon(CupertinoIcons.eye),
                            onTap: () => setState(() => _isObscured = false))
                        : InkWell(child: Icon(CupertinoIcons.eye_slash),
                            onTap: () => setState(() => _isObscured = true)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _height * 0.01),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){}, 
                  child: Text("Forgot password?", 
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontSize: _height * 0.02,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: _height * 0.355,
          left: _hCentered(0.285),
          // left: _width * 0.355,
          child: Align(
            child: ElevatedButton(
              onPressed: _isValidated()
              ? (){
                  var _otpCode = _uidController.text.substring(_uidController.text.length - 6);
                  Navigator
                    .of(context)
                    .push(MaterialPageRoute(builder: (context) 
                        => OTPScreen(_uidController.text, _otpCode)));
                } : null, 
              child: Text('Signin', textScaleFactor: 1.5),
              style: ElevatedButton.styleFrom(
                elevation: 5.0,
                shadowColor: Colors.red,
                primary: Colors.red.shade900,
                fixedSize: Size(_width * 0.285, double.infinity),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_height * 0.02),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: _height * 0.6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?",
                    style: TextStyle(
                      fontSize: _height * 0.02,
                      color: Colors.black87,
                  )),
                  TextButton(
                    onPressed: (){
                      Navigator
                        .of(context)
                        .push(MaterialPageRoute(builder: (context) 
                            => SignupScreen()));
                    }, 
                    child: Text("Signup here",
                      style: TextStyle(fontSize: _height * 0.02),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _width * 0.15,
                  vertical: _height * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container(height: 1.0, color: Colors.black54)),
                    Text("\t OR Continue with \t", textScaleFactor: 1.25),
                    Expanded(child: Container(height: 1.0, color: Colors.black54)),
                  ]
                ),
              ),
              SizedBox(height: _height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(Theme.of(context).platform == TargetPlatform.iOS)
                  Padding(
                    padding: EdgeInsets.only(right: _height * 0.015),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white54,
                        fixedSize: Size(_width * 0.15, _width * 0.15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_height * 0.015)),
                      ), 
                      child: Icon(FontAwesomeIcons.apple, 
                        color: Colors.black87,
                        size: _height * 0.045),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white54,
                      fixedSize: Size(_width * 0.15, _width * 0.15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_height * 0.015)),
                    ), 
                    child: Icon(FontAwesomeIcons.google, 
                      color: Colors.red.shade700,
                      size: _height * 0.04),
                  ),
                  SizedBox(width: _height * 0.015),
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white54,
                      fixedSize: Size(_width * 0.15, _width * 0.15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_height * 0.015)),
                    ), 
                    child: Icon(FontAwesomeIcons.twitter, 
                      color: Colors.blue.shade300,
                      size: _height * 0.04),
                  ),
                  SizedBox(width: _height * 0.015),
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white54,
                      fixedSize: Size(_width * 0.15, _width * 0.15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_height * 0.015)),
                    ), 
                    child: Icon(FontAwesomeIcons.facebook, 
                      color: Colors.blue.shade800,
                      size: _height * 0.04),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}