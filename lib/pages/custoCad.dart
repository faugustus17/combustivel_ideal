import 'package:flutter/material.dart';

class CustoCad extends StatefulWidget{
  @override
  _CustoCadState createState() => _CustoCadState();
}

class _CustoCadState extends State<CustoCad>{
  Widget buildAppBar(){
    return AppBar(
      title: Text("Combustível Ideal"),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }

  Widget buildScaffold(){
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      //floatingActionButton: buildFloatActionButton(),
      //body: buildListView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }
}