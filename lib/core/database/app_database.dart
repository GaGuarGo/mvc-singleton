import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final _intance = AppDatabase._();

  AppDatabase._();

  factory AppDatabase() => _intance;

  Database? database;

  Future<void> init() async {
    try {
      final dbPath = join(await getDatabasesPath(), 'user_database.db');

      database = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, _) async {
          return await db.execute(
              "CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, password TEXT)");
        },
      );

      log("Banco de Dados Local inicializado", name: "DB");
    } catch (e, s) {
      log("Erro ao inicializar banco de dados local",
          error: e, stackTrace: s, name: "DB");
    }
  }

  Future<void> dispose() async {
    if (database != null) await database?.close();
  }
}
