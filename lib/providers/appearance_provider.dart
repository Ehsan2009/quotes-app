import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppearanceProvider extends ChangeNotifier {
  final appearanceBox = Hive.box<String>('appearance');

  get imageUrl => appearanceBox.get('background_image');

  Future<void> toggleAppearance(String imageUrl) async {
    await appearanceBox.put('background_image', imageUrl);
    notifyListeners();
  }
}
