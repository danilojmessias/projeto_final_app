import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> getInstance() async {
    String dbname = 'tccbd.bd';
    String path = await getDatabasesPath() + dbname;
    var instance = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onOpen: _onOpen,
      onUpgrade: _onUpgrade,
      onDowngrade: _onDowngrade,
    );
    return instance;
  }

  static Future<void> _onCreate(Database db, int ver) async {
    debugPrint('******* onCreate *******');
    db.execute(
      'CREATE TABLE morador(id INTEGER PRIMARY KEY,nome TEXT, cpf TEXT,telefone TEXT,email TEXT,bloco TEXT,apartamento TEXT)',
    );
  }

  static Future<void> _onOpen(Database db) async {
    var version = await db.getVersion();
    debugPrint('*** Abrindo bd. Versão: $version *******');
  }

  static Future<void> _onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    debugPrint('*** Upgrade $oldVersion para $newVersion *******');
  }

  static Future<void> _onDowngrade(
      Database db, int oldVersion, int newVersion) async {
    debugPrint('*** Downgrade $newVersion para $oldVersion *******');
  }
}
