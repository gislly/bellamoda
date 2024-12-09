import 'package:sqflite/sqflite.dart';
import 'package:untitled1/bd/db_helper.dart';
import 'package:untitled1/domain/Catalogodoopcoesvestidos.dart';

class VestidoDao {

  saveVestido() async {

  }


  Future<List<Catalogodoopcoesvestidos>> listarVestidos() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM VESTIDOS;';
    var result = await database.rawQuery(sql);

    List<Catalogodoopcoesvestidos> lista = [];
    for (var json in result) {
      Catalogodoopcoesvestidos vestido =
          Catalogodoopcoesvestidos.fromJson(json);
      lista.add(vestido);
    }

    return lista;
  }
}
