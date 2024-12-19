import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/config/app_router.dart';
import 'package:quotes_app/constants.dart';
import 'package:quotes_app/providers/background_image_provider.dart';
import 'package:quotes_app/providers/theme_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnonKey,
  );

  // initialize hive
  await Hive.initFlutter();

  // open the box
  final imagesBox = await Hive.openBox('images');

  if (imagesBox.isEmpty) {
    await imagesBox.put(
      'background_image',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-8moments-1266810_11zon.jpg',
    );
    await imagesBox.put(
      'unlocked_images',
      ['https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-8moments-1266810_11zon.jpg'],
    );
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(
              create: (context) => BackgroundImageProvider()),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
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
