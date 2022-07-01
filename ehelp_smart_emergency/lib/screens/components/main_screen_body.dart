import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreenBody 
  extends StatefulWidget {

  @override
  _MainScreenBodyState createState() 
      => _MainScreenBodyState();
}

class _MainScreenBodyState 
  extends State<MainScreenBody> {
    
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(flex: 4,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: _width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/bg-map-01.png")),
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(_height * 0.02),
                  ),),),
                  Positioned(
                    top: _height * 0.10,
                    left: _width * 0.15,
                    // left: (_width / 2) - ((_width * 0.225) / 2),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset("assets/images/eHelp-logo-squared-new.png",
                        filterQuality: FilterQuality.medium,
                        width: _height * 0.11,
                  ),),),
                  Positioned(
                    left: _width * 0.44,
                    top: _height * 0.10,
                    child: RichText(
                      text: TextSpan(
                        text: "eHELP",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: _height * 0.0018,
                          fontSize: _height * 0.036, 
                          fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: "\nSmart Emergency",
                            style: TextStyle(fontSize: _height * 0.03, letterSpacing: 0.0)),
                          TextSpan(
                            text: "\nVersion\t: 0.01-beta",
                            style: TextStyle(fontSize: _height * 0.024, letterSpacing: 0.0)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 6,
              child: Container(
                color: Colors.red.shade900,
                child: Container(
                  width: _width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_height * 0.025)),
                    color: Color.fromRGBO(245, 245, 245, 1.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: _height * 0.09),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){},
                          onLongPress: (){},
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(
                              side: BorderSide(
                                width: _height * 0.008,
                                color: Theme.of(context).primaryColorLight
                              ),
                            ),
                            fixedSize: Size(_width * 0.36, _width * 0.36),
                            elevation: _height * 0.01,
                            shadowColor: Theme.of(context).primaryColor,
                          ),
                          child: Text("SOS", textScaleFactor: 3.6),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 240, 240, 1.0),
                          border: Border.all(color: Colors.red.shade900),
                          borderRadius: BorderRadius.circular(_height * 0.01)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: _height * 0.01, vertical: _height * 0.008),
                          child: Column(
                            children: [
                              Text("Press and hold the button above about 3 seconds."),
                              Text("Or, press the power button 5 times rapidly"),
                              SizedBox(height: _height * 0.006),
                              Text("For immediate emergency situation only!!!", 
                                style: TextStyle(color: Colors.red.shade900)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: _height * 0.025)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: _height * 0.23,
          left: (_width / 2) - (_width * 0.45),
          child: Material(
            elevation: 5.0,
            color: Colors.white,
            shadowColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_height * 0.025), 
              bottomRight: Radius.circular(_height * 0.025)),
            child: SizedBox(
              width: _width * 0.9,
              height: _height * 0.25,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: _height * 0.0125,
                      left: _height * 0.0125,
                      right: _height * 0.0125,
                    ),
                // padding: EdgeInsets.all(_height * 0.012),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.phone_in_talk, color: Colors.red.shade900),
                        SizedBox(width: _height * 0.015),
                        Expanded(
                          child: Text("Emergency Services", 
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: _height * 0.01),
                        Card(elevation: 2.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_height * 0.02)),
                          color: Colors.yellow.shade900,
                          child: InkWell(
                            child: SizedBox(
                              width: _width * 0.36,
                              height: _height * 0.094,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset("assets/icons/app-icon-follow.svg",
                                    height: _height * 0.04,
                                    fit: BoxFit.fitHeight),
                                  Text("FollowMe", 
                                    style: TextStyle(
                                      fontSize: _height * 0.026, color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),],),),
                            onTap: (){},
                            splashFactory: InkRipple.splashFactory,
                        ),),
                        SizedBox(width: _height * 0.005),
                        Card(elevation: 2.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_height * 0.02)),
                          color: Colors.green.shade800,
                          child: InkWell(
                            child: SizedBox(
                              width: _width * 0.36,
                              height: _height * 0.094,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(FontAwesomeIcons.plusCircle, 
                                        size: _height * 0.035, 
                                        color: Colors.white),
                                      SizedBox(width: _height * 0.008),
                                      Text("118", 
                                        style: TextStyle(
                                          fontSize: _height * 0.03, color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                  ),],),
                                  SizedBox(height: _height * 0.005),
                                  Text("Medical Help", 
                                    textAlign: TextAlign.center, 
                                    style: TextStyle(
                                      fontSize: _height * 0.022, color: Colors.white, 
                                      fontWeight: FontWeight.bold),
                            ),],),),
                            onTap: (){},
                            splashFactory: InkRipple.splashFactory,
                        ),),
                        SizedBox(width: _height * 0.005),
                        Card(elevation: 2.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_height * 0.02)),
                          color: Colors.red.shade800,
                          child: InkWell(
                            child: SizedBox(
                              width: _width * 0.36,
                              height: _height * 0.094,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: _height * 0.018,
                                        child: Icon(FontAwesomeIcons.gripfire, 
                                          size: _height * 0.025, 
                                          color: Colors.red.shade800),
                                        backgroundColor: Colors.white),
                                      SizedBox(width: _height * 0.008),
                                      Text("113", 
                                        style: TextStyle(
                                          fontSize: _height * 0.03, color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                  ),],),
                                  SizedBox(height: _height * 0.005),
                                  Text("Fire Emergency", 
                                    textAlign: TextAlign.center, 
                                    style: TextStyle(
                                      fontSize: _height * 0.022, color: Colors.white, 
                                      fontWeight: FontWeight.bold),
                            ),],),),
                            onTap: (){},
                            splashFactory: InkRipple.splashFactory,
                        ),),
                        SizedBox(width: _height * 0.005),
                        Card(elevation: 2.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_height * 0.02)),
                          color: Colors.blue.shade800,
                          child: InkWell(
                            child: SizedBox(
                              width: _width * 0.36,
                              height: _height * 0.094,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/icons/app-icon-polisi.svg",
                                        height: _height * 0.035,
                                        fit: BoxFit.fitHeight),
                                      SizedBox(width: _height * 0.008),
                                      Text("110", 
                                        style: TextStyle(
                                          fontSize: _height * 0.03, color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                  ),],),
                                  SizedBox(height: _height * 0.005),
                                  Text("Police Help", 
                                    textAlign: TextAlign.center, 
                                    style: TextStyle(
                                      fontSize: _height * 0.022, color: Colors.white, 
                                      fontWeight: FontWeight.bold),
                            ),],),),
                            onTap: (){},
                            splashFactory: InkRipple.splashFactory,
                        ),),
                        SizedBox(width: _height * 0.005),
                        Card(elevation: 2.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_height * 0.02)),
                          color: Colors.orange.shade900,
                          child: InkWell(
                            child: SizedBox(
                              width: _width * 0.36,
                              height: _height * 0.094,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset("assets/icons/app-icon-bengkel.svg",
                                    height: _height * 0.045,
                                    fit: BoxFit.fitHeight),
                                  Text("Car Emergency", 
                                    style: TextStyle(
                                      fontSize: _height * 0.022, fontWeight: FontWeight.bold,
                                      color: Colors.white),
                            ),],),),
                            onTap: (){},
                            splashFactory: InkRipple.splashFactory,
                        ),),
                        SizedBox(width: _height * 0.01),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: _height * 0.0045, horizontal: _height * 0.0125),
                    child: Divider(color: Colors.red.shade900),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: _height * 0.012,
                      right: _height * 0.012,
                    ),
                    child: InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.only(right: _height * 0.006),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.placemark_fill, 
                              size: _height * 0.026),
                            SizedBox(width: _height * 0.005),
                            Expanded(
                              child: Text("Plaza Festival Kuningan, Jakarta Selatan",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: _height * 0.02),
                              ),
                            ),
                            SizedBox(width: _height * 0.005),
                            Icon(FontAwesomeIcons.searchLocation, 
                              size: _height * 0.022),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}