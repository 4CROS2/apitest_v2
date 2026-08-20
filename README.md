# ApiTest

Aplicación Flutter de ejemplo que consulta productos de una API y los muestra
en una cuadrícula. Está pensada para practicar consumo de APIs, manejo de
estado, navegación y organización del código.

## Requisitos

- Flutter **3.44.0** (versión estable con la que se creó el proyecto).
- Dart **3.12.0** o compatible (definido en `pubspec.yaml`).
- Un emulador, dispositivo físico o navegador.

Comprueba tu instalación con:

```bash
flutter doctor
```

## Ejecutar el proyecto

1. Instala las dependencias:

   ```bash
   flutter pub get
   ```

2. Ejecuta la aplicación incluyendo la configuración de la API:

   ```bash
   flutter run --dart-define-from-file=.env
   ```

   Para elegir un dispositivo concreto, primero usa `flutter devices` y luego:

   ```bash
   flutter run -d <id-del-dispositivo> --dart-define-from-file=.env
   ```

El archivo `.env` define `BASE_API` y `PRODUCTS_ENDPOINT`. No se lee como un
archivo normal durante la ejecución: Flutter convierte esos valores en
variables de compilación gracias a `--dart-define-from-file`. La configuración
de VS Code en `.vscode/launch.json` ya incluye este argumento.

## Estructura y arquitectura

El código dentro de `lib/src/features` está agrupado por funcionalidad. La
pantalla de inicio (`home`) usa una versión sencilla de arquitectura por capas:

```text
presentation  ->  domain  ->  data
pantallas         reglas      API y modelos
widgets           entidades
controllers       casos de uso
```

| Carpeta | Responsabilidad |
| --- | --- |
| `lib/main.dart` | Punto de entrada: prepara Flutter, registra dependencias e inicia `App`. |
| `lib/src/features/app` | Configura `MaterialApp`, los temas y el estado global del tema. |
| `lib/src/core/router` | Declara las rutas `/home` y `/settings` con `go_router`. |
| `lib/src/features/shell` | Contiene la barra superior y la navegación inferior compartidas. |
| `lib/src/features/home/presentation` | Muestra productos y reacciona a los estados de carga, éxito o error. |
| `lib/src/features/home/domain` | Define `ProductEntity`, el contrato del repositorio y `HomeUsecase`. |
| `lib/src/features/home/data` | Hace la petición HTTP con Dio y convierte el JSON en modelos. |
| `lib/injection_container.dart` | Registra las dependencias con GetIt para poder reutilizarlas. |

## Cómo funciona la carga de productos

1. `HomePage` crea `HomeController` y llama a `fetchData()`.
2. El controlador cambia su estado a `loading` y avisa a la interfaz mediante
   `notifyListeners()`.
3. `HomeUsecase` solicita los datos a `HomeRepository`.
4. `HomeRepositoryImpl` usa `HomeDatasourceImpl`, que realiza un `GET` con
   Dio a `BASE_API + PRODUCTS_ENDPOINT`.
5. La respuesta JSON se convierte en `ProductModel`, que puede usarse como
   `ProductEntity`.
6. El controlador actualiza el estado a `success` o `error`; `Consumer`
   reconstruye la pantalla con un indicador, los productos o el mensaje de
   error.

El estado se maneja con `provider` y `ChangeNotifier`. Las dependencias se
obtienen desde el localizador `sl` de GetIt, registrado al iniciar la app.

## Navegación y tema

- La aplicación inicia en `/home`.
- `ShellPage` mantiene visibles la barra superior y la navegación inferior.
- La ruta de ajustes existe en `/settings`; actualmente es una pantalla base.
- `AppController` conserva el tema claro u oscuro y notifica los cambios a
  `MaterialApp`.

## Comandos útiles

```bash
# Ejecutar pruebas
flutter test

# Analizar el código
flutter analyze
```
