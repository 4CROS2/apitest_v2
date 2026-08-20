import 'package:apitest/injection_container.dart';
import 'package:apitest/src/features/app/presentation/page/app.dart';
import 'package:flutter/material.dart';

void main() {
  // Esto es necesario para inicializar el binding de Flutter antes de ejecutar la aplicación.
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa el contenedor de inyección de dependencias
  initializeContainer(); 
  runApp(App());
}
