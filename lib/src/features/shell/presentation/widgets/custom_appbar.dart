import 'package:apitest/src/features/app/domain/entity/custom_theme_entity.dart';
import 'package:apitest/src/features/app/presentation/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  void _toggleTheme(
    BuildContext context, {
    required CustomThemeEntity currentTheme,
  }) {
    context.read<AppController>().changeThemeMode(currentTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (BuildContext context, AppController appController, _) {
        return AppBar(
          title: Text('Api Test'),
          actions: [
            IconButton(
              icon: Icon(appController.theme.icon),
              onPressed: () =>
                  _toggleTheme(context, currentTheme: appController.theme),
            ),
          ],
        );
      },
    );
  }
}
