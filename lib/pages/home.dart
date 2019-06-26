import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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