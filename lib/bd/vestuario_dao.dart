import 'package:untitled1/bd/db_helperduda.dart';
import 'package:untitled1/domain/vestuario.dart';

class VestuarioDao {

listarPacotes() async {
  Database databaseduda = await DBHelper().initDB();
  String sql = 'SELECT * FROM ROUPAS;';
  var result = await databaseduda.rawQuery(sql);

  List<Vestuario> lista = [];
  for (var json in result) {
    Vestuario pacote = Vestuario.fromJson(json);
    lista.add(pacote);
  }
  return lista;
}
}
