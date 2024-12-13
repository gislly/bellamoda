import 'package:sqflite/sqflite.dart';
import 'package:untitled1/bd/db_helper.dart';
import 'package:untitled1/domain/Vestuario.dart';

class VestuarioDao {
  Future<List<Vestuario>> listarVestidos() async {
    Database database = await DBHelper().initDB();
    String sql = 'SELECT * FROM VESTIDOS;';
    var result = await database.rawQuery(sql);

    List<Vestuario> lista = [];
    for (var json in result) {
      Vestuario vestuario = Vestuario.fromJson(json);
      lista.add(vestuario);
    }
    return lista;
  }

  Future<List<Vestuario>> listarRoupas() async {
    Database database = await DBHelper().initDB();
    String sql = 'SELECT * FROM ROUPAS;';
    var result = await database.rawQuery(sql);

    List<Vestuario> lista = [];
    for (var json in result) {
      Vestuario vestuario = Vestuario.fromJson(json);
      lista.add(vestuario);
    }
    return lista;
  }

  Future<void> saveVestuario(Vestuario vestuario) async {
    Database database = await DBHelper().initDB();
    await database.insert(
      'ROUPAS',
      vestuario.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
