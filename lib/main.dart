import 'package:hive_flutter/hive_flutter.dart';
import 'package:macro_calculator/controllers/data_controller.dart';
import 'package:macro_calculator/controllers/theme_controller.dart';
import 'package:macro_calculator/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('data');
  await Hive.openBox('theme');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Macro Calculator',
            home: HomePage(),
            theme: ThemeData(
              primaryColor: Colors.red,
              accentColor: Colors.redAccent,
              brightness: theme.brightness,
            ),
          );
        },
      ),
    );
  }
}
