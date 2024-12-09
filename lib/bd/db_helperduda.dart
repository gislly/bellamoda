import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'vestuario.db');

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );
    return db;
  }

  FutureOr<void> onCreate(Database db, int version) async {
    String sql = '''
      CREATE TABLE ROUPAS (
        id INTEGER PRIMARY KEY,
        title VARCHAR(100),
        imageUrl VARCHAR(255),
        categoria VARCHAR(50)
      )
    ''';
    await db.execute(sql);

    await db.execute(
        "INSERT INTO ROUPAS (id, title, imageUrl, categoria) VALUES (1, 'Vestidos', 'https://mirak.jetassets.com.br/produto/20240227165413_253999747_D.jpg', 'vestidos')");
    await db.execute(
        "INSERT INTO ROUPAS (id, title, imageUrl, categoria) VALUES (2, 'Blusas', 'https://example.com/image2.jpg', 'blusas')");
    await db.execute(
        "INSERT INTO ROUPAS (id, title, imageUrl, categoria) VALUES (3, 'Calças', 'https://example.com/image3.jpg', 'calcas')");
    await db.execute(
        "INSERT INTO ROUPAS (id, title, imageUrl, categoria) VALUES (4, 'Shorts', 'https://example.com/image4.jpg', 'shorts')");
  }
}
