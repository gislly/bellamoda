import 'package:sqflite/sqflite.dart';
import 'package:untitled1/bd/db_helper.dart';
import 'package:untitled1/domain/Vestido.dart';

class VestidoDao {
  Future<List<Vestido>> listarVestidos() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM VESTIDOS;';
    var result = await database.rawQuery(sql);

    List<Vestido> lista = [];
    for (var json in result) {
      Vestido vestido =
          Vestido.fromJson(json);
      lista.add(vestido);
    }

    return lista;
  }
}
