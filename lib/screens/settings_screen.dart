import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/my_list_tile.dart';
import 'package:quotes_app/providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode();

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
                onTap: () {},
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
                switchOnChanged: (isChecked) {
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
