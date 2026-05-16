import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/utils/cart_provider.dart';
import 'package:provider/provider.dart';
import '/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        theme: AppThemes.LightTheme,
        darkTheme: AppThemes.DarkTheme,
        themeMode: ThemeMode.system,
        home: HomePage(),
      ),
    );
  }
}
