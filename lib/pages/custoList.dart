import 'package:flutter/material.dart';

class CustoList extends StatefulWidget{
  @override
  _CustoListState createState() => _CustoListState();
}

class _CustoListState extends State<CustoList> {

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