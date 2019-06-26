import 'package:combustivel_ideal/model/custo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CustoHelper{
  static final CustoHelper _instance = CustoHelper.internal();

  CustoHelper.internal();

  factory CustoHelper() => _instance;

  Database _db;

  Future<Database> initDb() async{
    final path = await getDatabasesPath();
    final pathDb = join(path, "custo.db");

    final String sql = "CREATE TABLE custo ("
        "c_id INTEGER PRIMARY KEY"
        "c_nome_posto TEXT, "
        "c_preco_alcool REAL, "
        "c_preco_gasolina REAL, "
        "c_data_hora TEXT"
    ")";

    return await openDatabase(
        pathDb,
        version: 1,
        onCreate: (Database db, int newerVersion) async{
          await db.execute(sql);
        }
    );
  }


  Future<Database> get db async {
    if(_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  //Fecha conexão com o banco.
  Future close() async{
    Database dbCusto = await db;
    dbCusto.close();
  }

  //Insere os dados no banco.
  Future<Custo> insert(Custo custo) async{
    Database dbCusto = await db;
    custo.id = await dbCusto.insert("custo", custo.toMap());
    return custo;
  }

  //Atualiza os dados no banco.
  Future<int> update(Custo custo)async {
    Database dbCusto = await db;
    return await dbCusto.update("custo",
        custo.toMap(), where: "c_id = ?",
        whereArgs: [custo.id]);
  }

  //Deleta dados no banco.
  Future<int> delete(int id) async{
    Database dbCusto = await db;
    return await dbCusto.delete("custo", where: "c_id = ?", whereArgs: [id]);
  }

  //Lista por ID.
  Future<Custo> selectById(int id) async {
    Database dbCusto = await db;
    List<Map> maps = await dbCusto.query(
        "custo",
        columns: [
          "c_id", "c_nome_posto", "c_preco_alcool", "c_preco_gasolina",
          "c_data_hora"],
        where: "c_id = ?",
        whereArgs: [id]
    );
    if (maps.length > 0){
      return Custo.fromMap(maps.first);
    } else {
      return null;
    }

  }

  //Lista Todos.
  Future<List> selectAll() async {
    Database dbCusto = await db;
    List list = await dbCusto.rawQuery("SELECT * FROM custo");
    List<Custo> lsCusto = List();
    for(Map m in list){
      lsCusto.add(Custo.fromMap(m));
    }
    return lsCusto;
  }
}