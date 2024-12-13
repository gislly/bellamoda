import 'package:sqflite/sqflite.dart';
import 'package:untitled1/bd/db_helper.dart';
import 'package:untitled1/domain/tela_carrinho.dart';

class CarrinhoDao {
  Future<List<TelaCarrinho>> listarPacotes() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM PACOTE;';
    var result = await database.rawQuery(sql);

    List<TelaCarrinho> lista = result.map((json) => TelaCarrinho.fromJson(json)).toList();

    return lista;
  }
}