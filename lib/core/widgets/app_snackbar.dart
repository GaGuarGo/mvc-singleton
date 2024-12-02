import 'package:flutter/material.dart';
import 'package:p2_topicos_especiais/core/navigation/app_navigation.dart';

showSuccessSnackbar(String title) {
  ScaffoldMessenger.of(AppNavigation.to.context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

showErrorSnackbar(String title) {
  ScaffoldMessenger.of(AppNavigation.to.context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

showInforSnackbar(String title) {
  ScaffoldMessenger.of(AppNavigation.to.context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
