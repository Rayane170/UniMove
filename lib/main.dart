import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,

      builder: (context, mode, child) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UniMove',

          themeMode: mode,

       
          theme: AppTheme.lightTheme,

          
          darkTheme: AppTheme.darkTheme,

          home: const LoginPage(),
        );
      },
    );
  }
}