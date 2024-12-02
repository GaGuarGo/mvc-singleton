import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/core/navigation/app_navigation.dart';
import 'package:p2_topicos_especiais/core/theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P2 Tópicos Especiais',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.theme,
      navigatorKey: AppNavigation.navigatorKey,
      routes: AppNavigation.routes,
      initialRoute: '/',
    );
  }
}
