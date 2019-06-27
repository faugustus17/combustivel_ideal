import 'package:combustivel_ideal/helpers/custo_helper.dart';
import 'package:combustivel_ideal/model/custo.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

import 'custoList.dart';

class CustoCad extends StatefulWidget{
  @override
  final Custo custo;

  CustoCad({this.custo});

  _CustoCadState createState() => _CustoCadState();
}

class _CustoCadState extends State<CustoCad>{

  CustoHelper helper = CustoHelper();

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
      _preco_alcoolController.text = _custoTemp.preco_alcool;
      _preco_gasolinaController.text = _custoTemp.preco_gasolina;
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

  void _showAlert(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Alerta",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
            ),
            content:  Text("Para o abastecimento com "+_calcular()+
                " é mais vantajoso!",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20.0),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.pop(context, _custoTemp.id=null);
                  helper.insert(_custoTemp);
                  _clear();
                },
                child: Text("OK"),
              ),
            ],
          );
        }
    );
  }

  void _clear(){
    _nomePostoController.clear();
    _preco_alcoolController.clear();
    _preco_gasolinaController.clear();
    _data_horaCntroller.clear();
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
                [dd, '/', mm, '/', yyyy, ' as ', HH, ':', nn, ":", ss]).toString();
            _custoTemp.data_hora = _data;
            _showAlert();
            //_clear();
          });
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
                  _custoTemp.preco_alcool = text;
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
                  _custoTemp.preco_gasolina = text;
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

  String _calcular(){
    double resultado = double.parse(_preco_alcoolController.text)
        / double.parse(_preco_gasolinaController.text);
    if(resultado > 0.7){
      return ("a Gasolina");
    }else{
      return ("o Álcool");
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }
}