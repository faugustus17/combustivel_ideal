import 'package:combustivel_ideal/model/custo.dart';
import 'package:flutter/material.dart';

class CustoCad extends StatefulWidget{
  final Custo custo;
  CustoCad({this.custo});

  @override
  _CustoCadState createState() => _CustoCadState();

}

class _CustoCadState extends State<CustoCad>{

  final _nomePostoController = TextEditingController();
  final _preco_alcoolController = TextEditingController();
  final _preco_gasolinaController = TextEditingController();
  final _data_horaCntroller = TextEditingController();

  final _nomeFocus = FocusNode();

  bool _custoEditado = false;

  Custo _custoTemp;

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
    );
  }

  /*RaisedButton raisedButton = RaisedButton(
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
        Navigator.pop(context, _custoTemp);
      }
    },
  );*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
         Padding(
            padding: EdgeInsets.only(top: 300.0),
            child: RaisedButton(
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
                  Navigator.pop(context, _custoTemp);
                }
              },
            ),
         ),
        ],
      ),
    );
  }

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
}