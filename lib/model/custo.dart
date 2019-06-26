class Custo{
  int id;
  String nome_posto;
  double preco_alcool;
  double preco_gasolina;
  String data_hora;

  Custo();

  Custo.fromMap(Map map){
    id = map["c_id"];
    nome_posto = map["c_nome_posto"];
    preco_alcool = map["c_preco_alcool"];
    preco_gasolina = map["c_preco_gasolina"];
    data_hora = map["c_data_hora"];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      "c_nome_posto" : nome_posto,
      "c_preco_alcool" : preco_alcool,
      "c_preco_gasolina" : preco_gasolina,
      "c_data_hora" : data_hora,
    };
    if (id != null){
      map["c_id"] = id;
    }
    return map;
  }
  
  @override
  String toString(){
    return "Custo["
        "id: $id, "
        "nome_posto: $nome_posto, "
        "preco_alcool: $preco_alcool, "
        "preco_gasolina: $preco_gasolina, "
        "data_hora: $data_hora"
        "]";
  }
}