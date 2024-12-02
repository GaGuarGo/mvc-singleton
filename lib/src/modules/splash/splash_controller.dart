import 'dart:developer';
import 'package:p2_topicos_especiais/core/database/app_database.dart';
import 'package:p2_topicos_especiais/core/navigation/app_navigation.dart';
import 'package:p2_topicos_especiais/core/widgets/app_snackbar.dart';
import 'package:p2_topicos_especiais/src/modules/auth/auth_controller.dart';
import 'package:p2_topicos_especiais/src/services/database/database_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController {
  static final _instance = SplashController._();

  SplashController._();

  factory SplashController() => _instance;

  final dbService = DatabaseServiceImpl();
  final authController = AuthController();
  Future<void> init() async {
    final sp = await SharedPreferences.getInstance();
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      await AppDatabase().init();

      await Future.delayed(const Duration(milliseconds: 500));

      try {
        final userId = sp.getString("id");

        final user = await dbService.getUserById(userId!);
        authController.user = user;

        AppNavigation.to.pushReplacementNamed('/home');
      } catch (e) {
        AppNavigation.to.pushReplacementNamed('/auth');
      }
    } catch (e, s) {
      log("Erro ao carregar módulo inicial",
          error: e, stackTrace: s, name: "Splash Module");
      showErrorSnackbar("Erro ao iniciar App");
    }
  }
}
