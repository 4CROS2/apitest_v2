import 'package:apitest/injection_container.dart';
import 'package:apitest/src/core/router/router.dart';
import 'package:apitest/src/features/app/presentation/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;
  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<AppController>(),
      child: Consumer<AppController>(
        builder: (BuildContext context, AppController controller, _) {
          return MaterialApp.router(
            title: 'ApiTest',
            // aqui se usa "dot shorthands" para acceder a los métodos de la clase ThemeData,
            // normalmente se usa ThemeData.light() y ThemeData.dark(), 
            // pero aquí se está usando un atajo para acceder a esos métodos
            // como .light y .dark, que son propiedades de la clase ThemeData.
            theme: ThemeData(
              brightness: .light,
              appBarTheme: const AppBarTheme(elevation: 1),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
            ),
            darkTheme: ThemeData(
              brightness: .dark,
              appBarTheme: const AppBarTheme(elevation: 1),
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.pink,
                brightness: .dark,
              ),
            ),
            themeMode: controller.theme.mode,
            routerConfig: _appRouter.router,
          );
        },
      ),
    );
  }
}
