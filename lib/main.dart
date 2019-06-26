import 'package:combustivel_ideal/pages/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashHome(),
    )
);

