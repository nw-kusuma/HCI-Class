import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'main_screen.dart';

class OTPScreen 
  extends StatefulWidget {
    final String otpMedium, otpCode;
  const OTPScreen(this.otpMedium, this.otpCode);

  @override
  _OTPScreenState createState() 
      => _OTPScreenState();
}

class _OTPScreenState 
  extends State<OTPScreen> {
    final _otpController = TextEditingController();
    bool _isValidated = false;
    bool _isLoading = false;

  static void _hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
    
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => _hideKeyboard(context),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(
          children: <Widget>[
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
              left: (_width / 2) - (_width * 0.45),
              child: Material(
                elevation: 5.0,
                color: Colors.white,
                shadowColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(_height * 0.025),
                child: SizedBox(
                  width: _width * 0.9,
                  height: _height * 0.35,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: _height * 0.0125,
                          left: _height * 0.0125,
                          right: _height * 0.0125,
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.lock_clock_sharp, color: Colors.red.shade900),
                            SizedBox(width: _height * 0.015),
                            Expanded(
                              child: Text("OTP Verification..", 
                                style: TextStyle(
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: _height * 0.024,
                            ),),),
                            IconButton(
                              onPressed: (){},
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                              icon: Icon(CupertinoIcons.question_diamond_fill,
                                size: _height * 0.024, 
                                color: Colors.red.shade900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 8.0,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: _height * 0.004, 
                          horizontal: _height * 0.0125),
                        child: Divider(color: Colors.red.shade900),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: _height * 0.015,
                          horizontal: _height * 0.025),
                        child: RichText(
                          text: TextSpan(
                            text: "Enter the code that we have sent to your phone, ",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: _height * 0.02),
                            children: [
                              TextSpan(
                                text: widget.otpMedium, 
                                style: TextStyle(color: Colors.red.shade900)
                              ),
                          ]),
                          textAlign: TextAlign.start),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: _height * 0.025,
                          left: _height * 0.025,
                          right: _height * 0.025, 
                          bottom: _height * 0.015),
                        child: Form(
                          child: PinCodeTextField(
                            length: 6, 
                            autoFocus: true,
                            appContext: context, 
                            controller: _otpController,
                            autoDisposeControllers: false,
                            autoDismissKeyboard: _isLoading ? true : false,
                            keyboardType: TextInputType.number,
                            animationType: AnimationType.fade,
                            textStyle: TextStyle(color: Colors.red.shade900),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(_height * 0.015),
                              activeColor: Colors.red.shade600,
                              selectedColor: Colors.red.shade800,
                              inactiveColor: Colors.red.shade200,
                              fieldWidth: _width / 9,
                            ),
                            validator: (codes){
                              if (codes!.length == 6){
                                if (codes == widget.otpCode){
                                  _isValidated = true;
                                } else {
                                  return "The OTP code didn't match!";
                                }
                              } return null;
                            },
                            onChanged: (code){
                              if (code.length < 6){
                                setState(() {
                                  _isValidated = false;
                                  _isLoading = false;
                                });
                              }
                            },
                            onCompleted: (_) {
                              if (_isValidated){
                                setState(() {
                                  _isLoading = true;
                                });
                                Future
                                  .delayed(Duration(seconds: 3), 
                                      () => Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(builder: 
                                              (BuildContext context) => MainScreen()), 
                                              (Route<dynamic> route) => false))
                                  .catchError((err){});
                              }
                            }
                          ),
                        ),
                      ),
                      // SizedBox(height: _height * 0.01),
                      if (_isLoading)
                      SizedBox(
                        width: _width / 5,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color> (Colors.red.shade900),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}