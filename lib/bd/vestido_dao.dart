import 'package:untitled1/bd/db_helper.dart';
import 'package:untitled1/domain/Catalogodoopcoesvestidos.dart';
import 'package:sqflite/sqflite.dart';

class CatalogoVestidosDao {
  Future<void> salvarVestido(Catalogodoopcoesvestidos vestido) async {
    Database database = await DBHelper().initDB();
    await database.insert('VESTIDOS', vestido.toJson());
  }

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
}
