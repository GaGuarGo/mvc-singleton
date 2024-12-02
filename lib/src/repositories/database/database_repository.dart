import 'package:p2_topicos_especiais/src/models/user_model.dart';

abstract class DatabaseRepository {
  Future<List<UserModel>> getUsers();
  Future<void> insertUser(String email, String password);
}
