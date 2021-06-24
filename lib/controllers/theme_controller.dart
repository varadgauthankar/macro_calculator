import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  Brightness brightness = Brightness.light;
  String key = 'brightness';

  ThemeController() {
    saveToPrefs();
    getFromPrefs().then((value) => brightness = value);
  }

  void toggleTheme() {
    if (this.brightness == Brightness.dark)
      this.brightness = Brightness.light;
    else
      this.brightness = Brightness.dark;
    saveToPrefs();
    notifyListeners();
  }

  saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, brightness.toString());
  }

  Future<Brightness> getFromPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(key);
    return Brightness.values.firstWhere((e) => e.toString() == value);
  }
}
