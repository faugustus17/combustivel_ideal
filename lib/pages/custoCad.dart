import 'package:combustivel_ideal/model/custo.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import 'custoList.dart';

class CustoCad extends StatefulWidget{
  final Custo custo;
  CustoCad({this.custo});

  @override
  _CustoCadState createState() => _CustoCadState();

}

class _CustoCadState extends State<CustoCad>{

  String _data='';

  final _nomePostoController = TextEditingController();
  final _preco_alcoolController = TextEditingController();
  final _preco_gasolinaController = TextEditingController();
  final _data_horaCntroller = TextEditingController();

  final _nomeFocus = FocusNode();

  bool _custoEditado = false;

  Custo _custoTemp;

  @override
  void initState(){
    super.initState();
    if(widget.custo == null){
      _custoTemp = Custo();
    }else{
      _custoTemp = Custo.fromMap(widget.custo.toMap());

      _nomePostoController.text = _custoTemp.nome_posto;
      _preco_alcoolController.text = _custoTemp.preco_alcool.toString();
      _preco_gasolinaController.text = _custoTemp.preco_gasolina.toString();
      _data_horaCntroller.text = _custoTemp.data_hora;
    }
  }

  Widget buildAppBar(){
    return AppBar(
      title: Text(
        "Combustível Ideal",
        style: TextStyle(
          color: Colors.blue[100],
        ),
      ),
      backgroundColor: Colors.black45,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list,
            color: Colors.blue[100],
            size: 40.0,
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustoList(),
              ),
            );
          },
        ),      
      ],
    );
  }

  Widget buildRaisedButton(){
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Text(
        "Verificar",
        style: TextStyle(fontSize: 20.0, color: Colors.blue[100]),
      ),
      color: Colors.black45,
      padding: EdgeInsets.fromLTRB(30.0, 15, 30.0, 15.0),
      onPressed: () {
        if(_custoTemp.nome_posto != null && _custoTemp.nome_posto.isNotEmpty){
          setState(() {
            _data = formatDate(DateTime.now(),
                [dd, '/', mm, '/', yyyy, 'as', HH, ':', nn, ":", ss]).toString();
          });
          _custoTemp.data_hora = _data;
          Navigator.pop(context, _custoTemp);
        } else {
          FocusScope.of(context).requestFocus(_nomeFocus);
        }
      },
    );
  }

  Widget buildScaffold(){
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Nome do Posto",
                  border: OutlineInputBorder(),
                ),
                onChanged: (text){
                  _custoEditado = true;
                  setState(() {
                    _custoTemp.nome_posto = text;
                  });
                },
                controller: _nomePostoController,
                focusNode: _nomeFocus,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Preço do álcool",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (text){
                  _custoEditado = true;
                  _custoTemp.preco_alcool =  double.parse(text);
                },
                controller: _preco_alcoolController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Preço da gasolina",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (text){
                  _custoEditado = true;
                  _custoTemp.preco_gasolina =  double.parse(text);
                },
                controller: _preco_gasolinaController,
              ),
              buildRaisedButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _calcular(){
    double pAlcool = double.parse(_preco_alcoolController.text);
    double pGasolina = double.parse(_preco_gasolinaController.text);


  }

  /*void _getDate(){
    return setState(() {
      _data = formatDate(DateTime.now(),
          [dd, '/', mm, '/', yyyy, 'as', HH, ':', nn, ":", ss]).toString();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }




}