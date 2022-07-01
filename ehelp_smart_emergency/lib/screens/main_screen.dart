import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/main_screen_body.dart';
import 'signin_screen.dart';

class MainScreen 
  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(244, 67, 54, 0.55),
        toolbarHeight: _height * 0.05,
        title: Padding(
          padding: EdgeInsets.only(left: _height * 0.012),
          child: InkWell(
            child: Row(
              children: [
                CircleAvatar(
                  radius: _height * 0.015,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: _height * 0.0125,
                    foregroundImage: AssetImage("assets/images/User_Mia.jpeg"),
                  ),
                ),
                SizedBox(width: _height * 0.015),
                Expanded(
                  child: Text("Mia Amaliah",
                    style: TextStyle(
                      fontSize: _height * 0.02, 
                      color: Colors.white, 
                      fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            onTap: (){},
          ),
        ),
        titleSpacing: 1.0,
        actions: [
          IconButton(
            onPressed: (){},
            padding: EdgeInsets.only(right: _height * 0.008),
            constraints: BoxConstraints(),
            icon: Icon(FontAwesomeIcons.bell, size: _height * 0.02)),
          IconButton(
            onPressed: (){
              Navigator
                .of(context)
                .pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => SigninScreen()), 
                  (Route<dynamic> route) => false);
            }, 
            padding: EdgeInsets.only(right: _height * 0.012),
            constraints: BoxConstraints(),
            icon: Icon(FontAwesomeIcons.bars, size: _height * 0.02),
          ),
      ],),
      body: MainScreenBody(),
    );
  }
}