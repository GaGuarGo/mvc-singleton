import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/src/modules/auth/auth_controller.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = AuthController().user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuário',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              user!.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Email:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              user.email!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Descrição:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Desenvolvedor Mobile Flutter com conhecimentos em Backend usando o ecossistema do framework Laravel',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Curso:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              "Análise e Desenvolvimento de Sistemas",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Semestre:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              "5º",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
