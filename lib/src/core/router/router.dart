import 'package:apitest/src/features/home/presentation/page/home_page.dart';
import 'package:apitest/src/features/settings/presentation/page/settings_page.dart';
import 'package:apitest/src/features/shell/presentation/page/shell_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<StatefulNavigationShellState> _shellNavigatorKey =
      GlobalKey<StatefulNavigationShellState>();
  late final GoRouter router = GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        key: _shellNavigatorKey,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (_, _, navigationShell) {
          return ShellPage(child: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) {
                  return HomePage();
                },
              ),
              GoRoute(
                path: '/settings',
                builder: (context, state) {
                  return SettingsPage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
