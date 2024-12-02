import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/core/widgets/app_loading.dart';
import 'package:p2_topicos_especiais/src/modules/splash/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashController().init();
  }

  @override
  Widget build(BuildContext context) {
    return const AppLoading(title: "Carregando Informações do App...");
  }
}
