import 'package:combustivel_ideal/helpers/custo_helper.dart';
import 'package:combustivel_ideal/model/custo.dart';
import 'package:flutter/material.dart';
import 'custoCad.dart';

class CustoList extends StatefulWidget{
  @override
  _CustoListState createState() => _CustoListState();
}

class _CustoListState extends State<CustoList> {

  CustoHelper helper = CustoHelper();

  List<Custo> lsCustos = List();

  void _loadAllCustos(){
    helper.selectAll().then((list){
      setState(() {
        lsCustos = list;
      });
    });
  }

  @override
  void initState(){
    super.initState();
    _loadAllCustos();
  }

  Widget buildAppBar(){
    return AppBar(

      title: Text("Combustível Ideal",
        style: TextStyle(color: Colors.blue[100]),
      ),
      automaticallyImplyLeading: false,

      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => CustoCad(),
              )
            );
          },
        ),
      ],
      iconTheme: IconThemeData(
        color: Colors.blue[100],
      ),
      backgroundColor: Colors.black45,

      centerTitle: true,
    );
  }

  Widget buildCardCusto(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        shape: StadiumBorder(
          side: BorderSide(width: 1.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Posto: "+
                      lsCustos[index].nome_posto ?? "-",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text("Preço do álcool: R\$ "+
                      lsCustos[index].preco_alcool ?? "-",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Text("Preço da gasolina: R\$ "+
                      lsCustos[index].preco_gasolina ?? "-",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Text("Consulta realizada em: "+
                      lsCustos[index].data_hora ?? "-",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      /*onTap: () {
        _showOptions(context, index);
      },*/
    );
  }

  Widget buildListView() {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: lsCustos.length,
        itemBuilder: (context, index) {
          return buildCardCusto(context, index);
        }
    );
  }


  Widget buildScaffold(){
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      //floatingActionButton: buildFloatActionButton(),
      body: buildListView(),
    );
  }



  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

}