import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // Inicializa o banco de dados
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'vestuario.db'); // Nome unificado do banco de dados

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate, // Chama a função de criação ao inicializar
    );
  }

  // Função de criação do banco de dados
  FutureOr<void> _onCreate(Database db, int version) async {
    // Criação da tabela PACOTE
    await db.execute('''
      CREATE TABLE PACOTE (
        id INTEGER PRIMARY KEY,
        titulo VARCHAR(100),
        url_image VARCHAR(200),
        descricao VARCHAR(200),
        preco VARCHAR(50)
      );
    ''');

    // Inserção de dados na tabela PACOTE
    await db.insert('PACOTE', {
      'id': 1,
      'titulo': 'Vestido Diana',
      'url_image': 'https://mirak.jetassets.com.br/produto/multifotos/hd/20240627091645_6846993154_DZ.jpg',
      'descricao': 'Vestido em couro curto',
      'preco': '270,00'
    });
    await db.insert('PACOTE', {
      'id': 2,
      'titulo': 'Short Layne',
      'url_image': 'https://mirak.jetassets.com.br/produto/multifotos/hd/20240621163405_3343996657_DMZ.jpg',
      'descricao': 'Short em alfaiataria claro',
      'preco': '200,00'
    });
    await db.insert('PACOTE', {
      'id': 3,
      'titulo': 'Calça Scarly',
      'url_image': 'https://mirak.jetassets.com.br/produto/multifotos/20240818094046_9628990372_DM.jpg',
      'descricao': 'Calça em alfaiataria preta',
      'preco': '320,00'
    });

    // Criação da tabela VESTIDOS
    await db.execute('''
      CREATE TABLE VESTIDOS (
        id INTEGER PRIMARY KEY,
        url_image VARCHAR(255),
        titulo VARCHAR(100),
        preco VARCHAR(100)
      );
    ''');

    // Inserção de dados na tabela VESTIDOS
    await db.insert('VESTIDOS', {
      'id': 1,
      'url_image': 'https://mirak.jetassets.com.br/produto/20240722213142_7509992491_D.jpg',
      'titulo': 'VESTIDO DIANA MIDI AZUL MARINO',
      'preco': '359,00'
    });
    await db.insert('VESTIDOS', {
      'id': 2,
      'url_image': 'https://mirak.jetassets.com.br/produto/multifotos/20240824190908_7791992209_DM.jpg',
      'titulo': 'VESTIDO CARLOTA PRETO',
      'preco': '270,00'
    });
    await db.insert('VESTIDOS', {
      'id': 3,
      'url_image': 'https://mirak.jetassets.com.br/produto/20241007185918_3470996530_D.jpg',
      'titulo': 'VESTIDO NOEMIA OF WHITE',
      'preco': '320,00'
    });

    // Criação da tabela ROUPAS
    await db.execute('''
      CREATE TABLE ROUPAS (
        id INTEGER PRIMARY KEY,
        title VARCHAR(100),
        imageUrl VARCHAR(255),
        categoria VARCHAR(50)
      );
    ''');

    // Inserção de dados na tabela ROUPAS
    await db.insert('ROUPAS', {
      'id': 1,
      'title': 'Vestidos',
      'imageUrl': 'https://mirak.jetassets.com.br/produto/20240227165413_253999747_D.jpg',
      'categoria': 'vestidos'
    });
    await db.insert('ROUPAS', {
      'id': 2,
      'title': 'Blusas',
      'imageUrl': 'https://example.com/image2.jpg',
      'categoria': 'blusas'
    });
    await db.insert('ROUPAS', {
      'id': 3,
      'title': 'Calças',
      'imageUrl': 'https://example.com/image3.jpg',
      'categoria': 'calcas'
    });
    await db.insert('ROUPAS', {
      'id': 4,
      'title': 'Shorts',
      'imageUrl': 'https://example.com/image4.jpg',
      'categoria': 'shorts'
    });
  }
}

