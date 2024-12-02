import 'package:p2_topicos_especiais/src/models/user_model.dart';

abstract class DatabaseService {
  Future<void> insertUser(String email, String password);

  Future<List<UserModel>> getUsersList();

  Future<UserModel> getUserByCredentials(String email, String password);

  Future<UserModel> getUserById(String id);
}
