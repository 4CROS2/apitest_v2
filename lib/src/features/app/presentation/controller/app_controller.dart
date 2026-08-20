import 'package:apitest/src/features/app/domain/entity/custom_theme_entity.dart';
import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  AppController({this._themeMode = .light});

  CustomThemeEntity _themeMode;

  CustomThemeEntity get theme => _themeMode;

  void changeThemeMode(CustomThemeEntity themeMode) {
   switch (themeMode) {
      case .light:
        _themeMode = .dark;
        break;
      case .dark:
        _themeMode = .light;
        break;
    }
    notifyListeners();
  }
}
