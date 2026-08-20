import 'package:flutter/material.dart';

enum CustomThemeEntity {
  light(mode: .light, icon: Icons.light_mode),
  dark(mode: .dark, icon: Icons.dark_mode);

  const CustomThemeEntity({required this.mode, required this.icon});

  final ThemeMode mode;
  final IconData icon;
}
