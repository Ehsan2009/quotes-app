import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/my_list_tile.dart';
import 'package:quotes_app/providers/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final appModeBox = Hive.box('appMode');
    final isDarkMode = appModeBox.get('isDarkMode');

    void openMyketPage() async {
      const myketIntentUrl =
          'myket://details?id=com.example.quotes_app'; // Replace with your package name
      const myketWebUrl =
          'https://myket.ir/app/com.example.quotes_app'; // Fallback URL for browser

      if (await canLaunchUrl(Uri.parse(myketIntentUrl))) {
        // Opens Myket if the app is installed
        await launchUrl(Uri.parse(myketIntentUrl));
      } else {
        // Opens the Myket page in the browser if the app is not installed
        await launchUrl(Uri.parse(myketWebUrl));
      }
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text('تنظیمات'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            children: [
              MyListTile(
                onTap: openMyketPage,
                icon: Icons.chat,
                title: 'دیدگاه‌ها و امتیازات',
                hasArrowForward: true,
              ),
              MyListTile(
                onTap: () {},
                icon: Icons.dark_mode,
                title: 'حالت تیره',
                hasArrowForward: false,
                switchValue: isDarkMode ? true : false,
                switchOnChanged: (isChecked) async {
                  themeProvider.toggleTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
