import 'package:sqflite/sqflite.dart';
import 'package: untitled1/bd/db_helper.dart'; // Substitua pelo caminho correto para o DBHelper
import 'package: untitled1/domain/cataloopcaovestido.dart'; // Substitua pelo caminho correto para sua classe


class VestidoDao {
  // Método para listar todos os vestidos
  Future<List<Catalogodoopcoesvestidos>> listarVestidos() async {
    // Inicializar o banco de dados
    Database database = await DBHelper().initDB();

    // Query para buscar todos os vestidos
    String sql = 'SELECT * FROM VESTIDOS;';
    var result = await database.rawQuery(sql);

    // Converter os resultados em objetos Catalogodoopcoesvestidos
    List<Catalogodoopcoesvestidos> lista = [];
    for (var json in result) {
      Catalogodoopcoesvestidos vestido = Catalogodoopcoesvestidos.fromJson(json);
      lista.add(vestido);
    }

    return lista;
  }

  // Método para inserir um vestido no banco de dados
  Future<void> inserirVestido(Catalogodoopcoesvestidos vestido) async {
    Database database = await DBHelper().initDB();

    await database.insert(
      'VESTIDOS',
      vestido.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}



import 'package:aula_913/bd/db_helper.dart';
import 'package:aula_913/domain/pacote_turistico.dart';
import 'package:sqflite/sqflite.dart';

class PacoteDao {
  listarPacotes() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM PACOTE;';
    var result = await database.rawQuery(sql);

    List<PacoteTuristico> lista = [];
    for (var json in result) {
      PacoteTuristico pacote = PacoteTuristico.fromJson(json);
      lista.add(pacote);
    }

    return lista;
  }
}