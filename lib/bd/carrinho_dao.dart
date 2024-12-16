import 'package:sqflite/sqflite.dart';
import '/bd/db_helper.dart';
import '/domain/carrinho.dart';
import 'package:flutter/material.dart';
class CarrinhoDao {
  salvarCarrinho(Carrinho carrinho) async {
    Database database = await DBHelper().initDB();
    database.insert(
      'PEÇAS',
      carrinho.toJson(),
    );
  }
  listarPecas() async {
    Database database = await DBHelper().initDB();
    String sql = 'SELECT * FROM PECAS;';
    var result = await database.rawQuery(sql);
    List<Carrinho> lista = [];
    for (var json in result) {
      CarrinhosalvarPeca(peca) {}
      Carrinho carrinho = Carrinho.fromJson(json);
      lista.add(carrinho);
    }
    return lista;
  }
}