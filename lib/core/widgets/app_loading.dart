import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final String? title;
  const AppLoading({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title ?? "Carregando..."),
            const SizedBox(height: 16),
            const LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
