import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/src/modules/home/home_controller.dart';
import 'package:validatorless/validatorless.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final formKey = GlobalKey<FormState>();

  final weighEC = TextEditingController();
  final heighEC = TextEditingController();

  final controller = HomeController();
  @override
  void dispose() {
    weighEC.dispose();
    heighEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top * 1.45,
              ),
              const Icon(Icons.calculate_rounded, size: 120),
              const SizedBox(height: 24),
              TextFormField(
                controller: weighEC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Informe o peso'),
                  Validatorless.number('Digite um número válido'),
                  Validatorless.min(1, 'O peso deve ser maior que zero'),
                ]),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: heighEC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura (m)',
                  border: OutlineInputBorder(),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Informe a altura'),
                  Validatorless.number('Digite um número válido'),
                  Validatorless.min(0, 'A altura deve ser maior que zero'),
                ]),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          controller.calculateIMC(weighEC.text, heighEC.text);
                        }
                      },
                      child: const Text('Calcular'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: OutlinedButton(
                      onPressed: () {
                        controller.clear(context);
                        setState(() {
                          weighEC.clear();
                          heighEC.clear();
                        });
                      },
                      child: const Text(
                        'Limpar',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<String>(
                valueListenable: controller.imcResult,
                builder: (context, imc, _) {
                  return Text(
                    imc,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
