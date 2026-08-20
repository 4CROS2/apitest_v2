import 'package:apitest/src/features/app/injection_container.dart';
import 'package:apitest/src/features/home/injection_container.dart';
import 'package:get_it/get_it.dart';

// Instancia de GetIt para la inyección de dependencias sl (service locator)
final GetIt sl = GetIt.instance;

/// Inicializa el contenedor de inyección de dependencias.
void initializeContainer() {
  // Aquí puedes inicializar tus dependencias y servicios necesarios para la aplicación.
  // Por ejemplo, si estás utilizando un contenedor de inyección de dependencias, puedes configurarlo aquí.

  initializeAppContainer();
  initializeHomeContainer();
}
