import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/config/app_router.dart';
import 'package:quotes_app/providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, themeProvider, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        bool isDarkMode = themeProvider.isDarkMode();

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: PersianFonts.vazirTextTheme,
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.light,
              seedColor: const Color.fromARGB(255, 102, 102, 143),
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            textTheme: PersianFonts.vazirTextTheme,
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: const Color(0xFF1E1E2C),
            ),
          ),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: router,
        );
      },
    );
  }
}
