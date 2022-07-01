import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/positioned_custom_painter.dart';
import '../otp_screen.dart';

class SignupScreenBody 
  extends StatefulWidget {

  @override
  _SignupScreenBodyState createState() 
      => _SignupScreenBodyState();
}

class _SignupScreenBodyState 
  extends State<SignupScreenBody> {
    final _uidController = TextEditingController();
    final _pwdController = TextEditingController();
    final _pwd2Controller = TextEditingController();
    final _nameController = TextEditingController();
    final _mailController = TextEditingController();

    bool _isNext = false;
    bool _isObscured = true;
    bool _isTermsAgreed = false;

    double _hCentered(_width){
      var deviceWidth = MediaQuery.of(context).size.width;
      return ((deviceWidth / 2) - ((deviceWidth * _width) / 2));
    }

    final _regex = RegExp(r"^(0?[7-9][1-9]{2}([0-9]{7,8}))$");
    bool _isUIDValidated(){
      if (_uidController.text.isNotEmpty && _regex.hasMatch(_uidController.text) &&
          _pwdController.text.isNotEmpty && _pwdController.text.length >= 8 &&
          _pwd2Controller.text.isNotEmpty && _pwd2Controller.text == _pwdController.text){
        return true;
      } return false;
    }

    bool _isIDValidated(){
      if (_nameController.text.isNotEmpty &&
          _mailController.text.isNotEmpty && 
          _isTermsAgreed){
        return true;
      } return false;
    }

  @override
  void initState() {
    _uidController.addListener(() => setState(() {}));
    _pwdController.addListener(() => setState(() {}));
    _pwd2Controller.addListener(() => setState(() {}));
    _nameController.addListener(() => setState(() {}));
    _mailController.addListener(() => setState(() {}));
    super.initState();
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
                  Icon(FontAwesomeIcons.userPlus, 
                    size: _height * 0.02,
                    color: Colors.red.shade900),
                  SizedBox(width: _height * 0.02),
                  Text("Welcome..", 
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: _height * 0.022,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.red.shade900),
              if(!_isNext)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _height * 0.008),
                child: Column(
                children: [
                  TextFormField(
                    controller: _uidController,
                    onChanged: (value){},
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
                  SizedBox(height: _height * 0.005),
                  TextFormField(
                    controller: _pwdController,
                    onChanged: (value){},
                    obscureText: _isObscured ? true : false,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
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
                  SizedBox(height: _height * 0.005),
                  TextFormField(
                    controller: _pwd2Controller,
                    onChanged: (value){},
                    obscureText: _isObscured ? true : false,
                    keyboardType: TextInputType.visiblePassword,
                    // textInputAction: TextInputAction.,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Confirm password',
                      // labelStyle: TextStyle(color: Colors.red.shade900),
                      floatingLabelStyle: TextStyle(fontSize: _height * 0.025),
                      suffixIcon: _pwd2Controller.text.isEmpty 
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
              if (_isNext)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _height * 0.008),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      onChanged: (value){},
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Name',
                        // labelStyle: TextStyle(color: Colors.red.shade900),
                        floatingLabelStyle: TextStyle(fontSize: _height * 0.025),
                        suffixIcon: _nameController.text.isEmpty
                          ? Icon(Icons.person)
                          : InkWell(child: Icon(Icons.close),
                              onTap: () => _nameController.clear())
                    ),),
                    SizedBox(height: _height * 0.005),
                    TextFormField(
                      controller: _mailController,
                      onChanged: (value){},
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Email',
                        // labelStyle: TextStyle(color: Colors.red.shade900),
                        floatingLabelStyle: TextStyle(fontSize: _height * 0.025),
                        suffixIcon: _mailController.text.isEmpty
                          ? Icon(Icons.mail_outline)
                          : InkWell(child: Icon(Icons.close),
                              onTap: () => _mailController.clear())
                    ),),
                  ],
                ),
              ),
              SizedBox(height: _height * 0.02),
              if (_isNext)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _isTermsAgreed,
                    activeColor: Colors.red.shade900,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_height * 0.005)), 
                    onChanged: (value) => setState(
                                    () => _isTermsAgreed = value!)
                  ),
                  RichText(
                    text: TextSpan(
                      text: "I acknowledges and conforms to the",
                      style: TextStyle(color: Colors.black87),
                      children: [
                        TextSpan(
                          text: "\nTerms & Conditions", 
                          style: TextStyle(color: Colors.red.shade900)
                        ),
                        TextSpan(text: " and ", 
                        ),TextSpan(
                          text: "Privacy Policies.", 
                          style: TextStyle(color: Colors.red.shade900)
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: _height * 0.355,
          left: _hCentered(0.285),
          child: Align(
            child: ElevatedButton(
              onPressed:  !_isNext 
                          ? (_isUIDValidated() ? () => setState(() => _isNext = true)
                                              : null)
                          : (_isIDValidated() 
                              ? (){ var _otpCode = _uidController.text
                                                   .substring(_uidController.text.length - 6);
                                    Navigator
                                      .of(context)
                                      .push(MaterialPageRoute(builder: (context) 
                                          => OTPScreen(_uidController.text, _otpCode)));
                                  } 
                              : null), 
              child: Text(_isNext ? 'Signup' : 'Next', 
                textScaleFactor: 1.5),
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
                  Text("Already have account?",
                    style: TextStyle(
                      fontSize: _height * 0.02,
                      color: Colors.black87,
                  )),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    child: Text("Signin here",
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
                    Text("\t OR Sign-in with \t", textScaleFactor: 1.25),
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