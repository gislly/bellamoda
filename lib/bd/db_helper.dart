import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // Função para inicializar o banco de dados
  Future<Database> initDB() async {
    // Obter o caminho do banco de dados
    String path = await getDatabasesPath();
    String dbPath = join(path, 'vestuario.db');

    // Abrir o banco de dados (ou criar se não existir)
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate, // Definir a função de criação
    );
  }

  // Função que será chamada ao criar o banco de dados
  FutureOr<void> _onCreate(Database db, int version) async {
    // Criar a tabela VESTIDOS
    String createVestidosTable = '''
      CREATE TABLE VESTIDOS (
        id INTEGER PRIMARY KEY,
        url_image VARCHAR(255),
        titulo VARCHAR(100),
        preco VARCHAR(100)
      )
    ''';
    await db.execute(createVestidosTable);

    // Inserir dados na tabela VESTIDOS
    await db.execute(
        "INSERT INTO VESTIDOS (id, url_image, titulo, preco) VALUES (1, 'https://mirak.jetassets.com.br/produto/20240722213142_7509992491_D.jpg', 'VESTIDO DIANA MIDI AZUL MARINO', '359,00')"
    );
    await db.execute(
        "INSERT INTO VESTIDOS (id, url_image, titulo, preco) VALUES (2, 'https://mirak.jetassets.com.br/produto/multifotos/20240824190908_7791992209_DM.jpg', 'VESTIDO CARLOTA PRETO', '270,00')"
    );
    await db.execute(
        "INSERT INTO VESTIDOS (id, url_image, titulo, preco) VALUES (3, 'https://mirak.jetassets.com.br/produto/20241007185918_3470996530_D.jpg', 'VESTIDO NOEMIA OF WHITE', '320,00')"
    );

    // Criar a tabela ROUPAS
    String createRoupasTable = '''
      CREATE TABLE ROUPAS (
        id INTEGER PRIMARY KEY,
        title VARCHAR(100),
        imageUrl VARCHAR(255),
        categoria VARCHAR(50)
      )
    ''';
    await db.execute(createRoupasTable);

    // Inserir dados na tabela ROUPAS
    await db.execute(
        "INSERT INTO ROUPAS (id, title, imageUrl, categoria) VALUES (1, 'Vestidos', 'https://mirak.jetassets.com.br/produto/20240227165413_253999747_D.jpg', 'vestidos')"
    );
    await db.execute(
        "INSERT INTO ROUPAS (id, title, imageUrl, categoria) VALUES (2, 'Blusas', 'https://example.com/image2.jpg', 'blusas')"
    );
    await db.execute(
        "INSERT INTO ROUPAS (id, title, imageUrl, categoria) VALUES (3, 'Calças', 'https://example.com/image3.jpg', 'calcas')"
    );
    await db.execute(
        "INSERT INTO ROUPAS (id, title, imageUrl, categoria) VALUES (4, 'Shorts', 'https://example.com/image4.jpg', 'shorts')"
    );
  }
}
