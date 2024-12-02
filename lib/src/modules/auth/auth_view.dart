import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/core/widgets/app_loading.dart';
import 'package:p2_topicos_especiais/src/modules/auth/auth_controller.dart';
import 'package:validatorless/validatorless.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final controller = AuthController();

  bool visiblePassword = false;

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: controller.loading,
        builder: (context, loading, _) {
          if (loading) return const AppLoading();

          return Scaffold(
            appBar: AppBar(
              title: const Text('LOGIN'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top * 1.4,
                      ),
                      const Icon(
                        CupertinoIcons.person_alt_circle,
                        color: Colors.black,
                        size: 120,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: emailEC,
                        decoration: const InputDecoration(
                            hintText: 'seuemail@email.com',
                            labelText: 'Digite seu email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo obrigatório'),
                          Validatorless.email('Email inválido'),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: passwordEC,
                        decoration: InputDecoration(
                          hintText: '',
                          labelText: 'Digite sua senha',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visiblePassword = !visiblePassword;
                              });
                            },
                            icon: Icon(visiblePassword
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye),
                          ),
                        ),
                        obscureText: !visiblePassword,
                        keyboardType: TextInputType.visiblePassword,
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo obrigatório'),
                          Validatorless.min(
                              6, 'Digite uma senha maior que 6 caracteres'),
                        ]),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            await controller.login(
                                emailEC.text, passwordEC.text);
                          }
                        },
                        label: const Text('Entrar'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            await controller.signUp(
                                emailEC.text, passwordEC.text);
                          }
                        },
                        label: const Text('Cadastrar'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
