import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  Box box = Hive.box('theme');

  ThemeController() {
    _themeMode = ThemeMode.values[box.get('themeMode') ?? 1];
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.dark)
      _themeMode = ThemeMode.light;
    else
      _themeMode = ThemeMode.dark;
    box.put('themeMode', _themeMode.index);
    notifyListeners();
  }
}
