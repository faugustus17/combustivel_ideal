import 'package:flutter/material.dart';

import 'custoCad.dart';

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
              builder: (context) => CustoCad()
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.0),
              ),
              Text(
                "Combustível Ideal",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
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
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Container(
          width: double.maxFinite,
          height: 50,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Versão 1.0",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          )
      ),
    );
  }
}