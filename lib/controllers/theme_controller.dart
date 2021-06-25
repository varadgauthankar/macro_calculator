import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeController extends ChangeNotifier {
  Brightness brightness = Brightness.light;
  Box box = Hive.box('theme');

  ThemeController() {
    brightness = Brightness.values[box.get('brightness') ?? 1];
  }

  void toggleTheme() {
    if (this.brightness == Brightness.dark)
      this.brightness = Brightness.light;
    else
      this.brightness = Brightness.dark;
    box.put('brightness', brightness.index);
    notifyListeners();
  }
}
