import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import '/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.LightTheme,
      darkTheme: AppThemes.DarkTheme,
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
