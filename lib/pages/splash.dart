import 'package:flutter/material.dart';

import 'home.dart';

class SplashHome extends StatefulWidget{
  @override
  _SplashHomeState createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome>{
  @override
  void initState(){
    Future.delayed(Duration(seconds: 5)).then(( _ ){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo_splash.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}