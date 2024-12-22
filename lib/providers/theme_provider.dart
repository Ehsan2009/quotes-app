import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {
  final appModeBox = Hive.box('appMode');

  bool isDarkMode() {
    return appModeBox.get('isDarkMode');
  }

  Future<void> toggleTheme() async {
    final isDarkMode = appModeBox.get('isDarkMode');
    await appModeBox.put('isDarkMode', !isDarkMode);
    notifyListeners();
  }
}
