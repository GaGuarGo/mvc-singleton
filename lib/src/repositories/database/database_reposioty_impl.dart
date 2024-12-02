import 'dart:developer';

import 'package:p2_topicos_especiais/core/database/app_database.dart';
import 'package:p2_topicos_especiais/src/models/user_model.dart';
import 'package:p2_topicos_especiais/src/repositories/database/database_repository.dart';

class DatabaseReposiotyImpl extends DatabaseRepository {
  final _database = AppDatabase();

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final users = await _database.database!.rawQuery("SELECT * FROM users");

      return users.map((u) => UserModel.fromDatabase(u)).toList();
    } catch (e, s) {
      log('Erro ao recuperar lista de usuários', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> insertUser(String email, String password) async {
    try {
      await _database.database
          ?.rawInsert("INSERT INTO users(email, password) VALUES(?,?)", [email, password]);
    } catch (e, s) {
      log("Erro ao inserir usuário no banco de dados", error: e, stackTrace: s);
    }
  }
}
