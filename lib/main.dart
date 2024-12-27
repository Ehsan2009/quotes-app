import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myket_iap/myket_iap.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/config/app_router.dart';
import 'package:quotes_app/app_constants.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/providers/background_image_provider.dart';
import 'package:quotes_app/providers/theme_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyketIAP.init(rsaKey: AppConstants.rsaKey);

  await Hive.initFlutter();

  Hive.registerAdapter(QuoteAdapter());

  final imagesBox = await Hive.openBox('images');
  await Hive.openBox<Quote>('favoriteQuotes');
  final appModeBox = await Hive.openBox('appMode');

  if (imagesBox.isEmpty) {
    await imagesBox.put(
      'background_image',
      AppConstants.defaultBackgroundImageUrl,
    );
    await imagesBox.put(
      'unlocked_images',
      [AppConstants.defaultBackgroundImageUrl],
    );
  }

  if (appModeBox.isEmpty) {
    await appModeBox.put('isDarkMode', false);
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(
            create: (context) => BackgroundImageProvider(),
          ),
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
        final appModeBox = Hive.box('appMode');
        final isDarkMode = appModeBox.get('isDarkMode');

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
