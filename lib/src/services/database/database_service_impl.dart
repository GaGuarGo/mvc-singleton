import 'package:p2_topicos_especiais/src/models/user_model.dart';
import 'package:p2_topicos_especiais/src/repositories/database/database_reposioty_impl.dart';

import './database_service.dart';

class DatabaseServiceImpl extends DatabaseService {
  final repository = DatabaseReposiotyImpl();
  @override
  Future<void> insertUser(String email, String password) =>
      repository.insertUser(email, password);

  @override
  Future<List<UserModel>> getUsersList() => repository.getUsers();

  @override
  Future<UserModel> getUserByCredentials(String email, String password) async {
    final users = await repository.getUsers();

    return users.where((u) => u.email == email && u.password == password).first;
  }

  @override
  Future<UserModel> getUserById(String id) async {
    final users = await repository.getUsers();

    return users.where((u) => u.id == id).first;
  }
}
