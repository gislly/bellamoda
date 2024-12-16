import 'package:untitled1/bd/db_helper.dart';
import 'package:untitled1/domain/vestuario.dart';
import 'package:sqflite/sqflite.dart';

class VestuarioDao {
  salvarVestuario(Vestuario vestuario) async {
    Database database = await DBHelper().initDB();
    await database.insert(
      'ROUPAS', // Nome da tabela
      vestuario.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  listarRoupas() async {
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
}
