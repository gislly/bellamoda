import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'vestuario.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    // TABLE VESTIDOS
    String sql =
        'CREATE TABLE VESTIDOS (id INTEGER PRIMARY KEY AUTOINCREMENT, url_image VARCHAR(255), titulo VARCHAR(100), preco VARCHAR(100));';
    await db.execute(sql);
    // VESTIDOS
    sql =
    "INSERT INTO VESTIDOS (url_image, titulo, preco) VALUES ('https://mirak.jetassets.com.br/produto/20240722213142_7509992491_D.jpg', 'VESTIDO DIANA MIDI AZUL MARINO', '359,00')";
    await db.execute(sql);
    sql =
    "INSERT INTO VESTIDOS (url_image, titulo, preco) VALUES ('https://mirak.jetassets.com.br/produto/multifotos/20240824190908_7791992209_DM.jpg', 'VESTIDO CARLOTA PRETO', '270,00')";
    await db.execute(sql);
    sql =
    "INSERT INTO VESTIDOS (url_image, titulo, preco) VALUES ('https://mirak.jetassets.com.br/produto/20241007185918_3470996530_D.jpg', 'VESTIDO NOEMIA OF WHITE', '320,00')";
    await db.execute(sql);

    // TABLE ROUPAS
    sql =
    'CREATE TABLE ROUPAS (id INTEGER PRIMARY KEY AUTOINCREMENT, url_image VARCHAR(255), titulo VARCHAR(100));';
    await db.execute(sql);
    sql =
    "INSERT INTO ROUPAS (id, url_image, titulo) VALUES (0, 'https://mirak.jetassets.com.br/produto/20240428133903_9465990535_D.jpg', 'Vestidos')";
    await db.execute(sql);
    sql =
    "INSERT INTO ROUPAS (id, url_image, titulo) VALUES (1, 'https://mirak.jetassets.com.br/produto/20240706225809_4933995067_D.jpg', 'Blusas')";
    await db.execute(sql);
    sql =
    "INSERT INTO ROUPAS (id, url_image, titulo) VALUES (2, 'https://mirak.jetassets.com.br/produto/20240227170612_391999609_D.jpg', 'Calças')";
    await db.execute(sql);
    sql =
    "INSERT INTO ROUPAS (id, url_image, titulo) VALUES (4, 'https://mirak.jetassets.com.br/produto/20240131075255_91999909_D.jpg', 'Shorts')";
    await db.execute(sql);

    // TABLE USER
    sql =
    "CREATE TABLE USER (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT);";
    await db.execute(sql);
    // USER
    sql =
    "INSERT INTO USER(username, password) VALUES('contatobellamoda@gmail.com', 'roupas123')";
    await db.execute(sql);
  }
}
