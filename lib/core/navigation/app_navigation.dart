import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/src/modules/auth/auth_view.dart';
import 'package:p2_topicos_especiais/src/modules/home/home_view.dart';
import 'package:p2_topicos_especiais/src/modules/home/pages/imc_page.dart';
import 'package:p2_topicos_especiais/src/modules/home/pages/user_info_page.dart';
import 'package:p2_topicos_especiais/src/modules/splash/splash_view.dart';

class AppNavigation {
  AppNavigation._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get to => navigatorKey.currentState!;

  static final routes = <String, Widget Function(BuildContext)>{
    '/': (_) => const SplashView(),
    '/auth': (_) => const AuthView(),
    '/home': (_) => const HomeView(),
    '/home/imc': (_) => const ImcPage(),
    '/home/user-info': (_) => const UserInfoPage(),
  };
}
