import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';




class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'pacote.db');




    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );
  }




  FutureOr<void> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE VESTIDOS (id INTEGER PRIMARY KEY, url_image TEXT, titulo TEXT, preço TEXT);';
    await db.execute(sql);




    sql = 'CREATE TABLE PACOTE (id INTEGER PRIMARY KEY, url_image TEXT, titulo TEXT, preco TEXT);';
    await db.execute(sql);




    sql = "INSERT INTO PACOTE (id, url_image, titulo, preco) VALUES (1, 'https://mirak.jetassets.com.br/produto/20240722213142_7509992491_D.jpg', 'VESTIDO DIANA MIDI AZUL MARINO', '359,00');";
    await db.execute(sql);




    sql = "INSERT INTO PACOTE (id, url_image, titulo, preco) VALUES (2, 'https://mirak.jetassets.com.br/produto/multifotos/20240824190908_7791992209_DM.jpg', 'VESTIDO CARLOTA PRETO', '270,00');";
    await db.execute(sql);




    sql = "INSERT INTO PACOTE (id, url_image, titulo, preco) VALUES (3, 'https://mirak.jetassets.com.br/produto/20241007185918_3470996530_D.jpg', 'VESTIDO NOEMIA OFF WHITE', '320,00');";
    await db.execute(sql);




    sql = "CREATE TABLE USER (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT);";
    await db.execute(sql);




    sql = "INSERT INTO USER(username, password) VALUES('contatobellamoda@gmail.com', 'roupas123')";
    await db.execute(sql);
  }
}
