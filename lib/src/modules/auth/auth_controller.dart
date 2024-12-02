import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/core/navigation/app_navigation.dart';
import 'package:p2_topicos_especiais/core/widgets/app_snackbar.dart';
import 'package:p2_topicos_especiais/src/models/user_model.dart';
import 'package:p2_topicos_especiais/src/services/database/database_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  AuthController._();
  static final _instance = AuthController._();
  factory AuthController() => _instance;

  final dbService = DatabaseServiceImpl();

  UserModel? user;
  final loading = ValueNotifier<bool>(false);

  Future<void> signUp(String email, String password) async {
    loading.value = true;
    try {
      await dbService.insertUser(email, password);

      user = await dbService.getUserByCredentials(email, password);

      await setUserLocally();
      log("Usuário Cadastrado: $user", name: 'AUTH');

      await Future.delayed(const Duration(seconds: 1));

      showSuccessSnackbar("Cadastrado feito com Sucesso!");

      await AppNavigation.to.pushReplacementNamed('/home');
    } catch (e, s) {
      showErrorSnackbar("Erro ao fazer Cadastro");
      log("Erro ao fazer cadastro do Usuário($email, $password)",
          error: e, stackTrace: s, name: "AUTH");
    } finally {
      loading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    loading.value = true;
    try {
      user = await dbService.getUserByCredentials(email, password);
      await setUserLocally();
      log("Usuário Logado: $user", name: 'AUTH');

      await Future.delayed(const Duration(seconds: 1));

      showSuccessSnackbar("Login feito com Sucesso!");
      await AppNavigation.to.pushReplacementNamed('/home');
    } catch (e, s) {
      showErrorSnackbar("Erro ao fazer Login");
      log("Erro ao fazer login do Usuário($email, $password)",
          error: e, stackTrace: s, name: "AUTH");
    } finally {
      loading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      final sp = await SharedPreferences.getInstance();

      await sp.remove("id");
      user = UserModel();

      showInforSnackbar("Você foi Desconectado");

      AppNavigation.to.pushReplacementNamed("/auth");
    } catch (e, s) {
      log("Erro ao fazer logout", error: e, stackTrace: s, name: "AUTH");
    }
  }

  Future<void> setUserLocally() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("id", user!.id!);
  }
}
