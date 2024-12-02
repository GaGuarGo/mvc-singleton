import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/core/widgets/app_snackbar.dart';

class HomeController {
  static final _instance = HomeController._();

  HomeController._();

  factory HomeController() => _instance;

  final imcResult = ValueNotifier<String>("Seu IMC Aparecerá Aqui!");

  void calculateIMC(String weightText, String heightText) {
    try {
      final weight = double.tryParse(weightText);
      final height = double.tryParse(heightText);

      if (weight != null && height != null && height > 0) {
        final imc = weight / (height * height);

        imcResult.value = "Seu IMC é ${imc.toStringAsFixed(2)}";

        showSuccessSnackbar("IMC calculado com Sucesso");
      }
    } catch (e, s) {
      showErrorSnackbar("Algo deu errado ao calcular seu IMC");
      log("Erro ao calcular IMC", error: e, stackTrace: s, name: "HOME");
    }
  }

  void clear(BuildContext context) {
    imcResult.value = "Seu IMC Aparecerá Aqui!";
    Focus.of(context).unfocus();
  }
}
