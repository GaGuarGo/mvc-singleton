import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/core/navigation/app_navigation.dart';
import 'package:p2_topicos_especiais/src/modules/auth/auth_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          await AuthController().logout();
        },
        tooltip: "Sair",
        child: const Icon(Icons.exit_to_app, color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top * 1.45,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .3,
              child: Image.asset("assets/images/home.png"),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        AppNavigation.to.pushNamed('/home/imc');
                      },
                      label: const Text('Calculadora IMC'),
                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        AppNavigation.to.pushNamed('/home/user-info');
                      },
                      label: const Text(
                        'Usuário',
                        textAlign: TextAlign.center,
                      ),
                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
