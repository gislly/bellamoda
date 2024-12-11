import 'package:sqflite/sqflite.dart';
import 'package:untitled1/bd/db_helper.dart';
import 'package:untitled1/domain/catalogodoopcoesvestidos.dart'; // Importando o modelo

class VestidoDao {
  Future<List<Catalogodoopcoesvestidos>> listarVestidos() async {
    Database database = await DBHelper().initDB();
    String sql = 'SELECT * FROM VESTIDOS;';
    var result = await database.rawQuery(sql);

    List<Catalogodoopcoesvestidos> lista = [];
    for (var json in result) {
      Catalogodoopcoesvestidos vestido = Catalogodoopcoesvestidos.fromJson(json);
      lista.add(vestido);
    }
    return lista;
  }
  Future<List<Catalogodoopcoesvestidos>> listarRoupas() async {
    Database database = await DBHelper().initDB();
    String sql = 'SELECT * FROM ROUPAS;';
    var result = await database.rawQuery(sql);

    List<Catalogodoopcoesvestidos> lista = [];
    for (var json in result) {
      Catalogodoopcoesvestidos roupa = Catalogodoopcoesvestidos.fromJson(json);
      lista.add(roupa);
    }
    return lista;
  }

  // Método para inserir um novo vestido
  Future<void> inserirVestido(Catalogodoopcoesvestidos vestido) async {
    Database database = await DBHelper().initDB();
    String sql = '''
      INSERT INTO VESTIDOS (url_image, titulo, preco) 
      VALUES (?, ?, ?);
    ''';
    await database.rawInsert(sql, [vestido.urlImage, vestido.titulo, vestido.preco]);
  }

  // Método para atualizar um vestido (sem id, usando dados únicos como url_image ou titulo)
  Future<void> atualizarVestido(Catalogodoopcoesvestidos vestido) async {
    Database database = await DBHelper().initDB();
    String sql = '''
      UPDATE VESTIDOS 
      SET url_image = ?, titulo = ?, preco = ? 
      WHERE url_image = ? AND titulo = ?;
    ''';
    await database.rawUpdate(
        sql, [vestido.urlImage, vestido.titulo, vestido.preco, vestido.urlImage, vestido.titulo]);
  }

  // Método para deletar um vestido (sem id, usando dados únicos como url_image ou titulo)
  Future<void> deletarVestido(Catalogodoopcoesvestidos vestido) async {
    Database database = await DBHelper().initDB();
    String sql = 'DELETE FROM VESTIDOS WHERE url_image = ? AND titulo = ?;';
    await database.rawDelete(sql, [vestido.urlImage, vestido.titulo]);
  }
}