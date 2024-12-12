import 'package:sqflite/sqflite.dart';

class VestuarioDao {

listarPacotes() async {
  Database databaseduda = await DBHelper().initDB();
  String sql = 'SELECT * FROM PACOTE;';
  var result = await databaseduda.rawQuery(sql);

  List<Vestuario> lista = [];
  for (var json in result) {
    Vestuario pacote = Vestuario.fromJson(json);
    lista.add(pacote);
  }
  return lista;
}
}
