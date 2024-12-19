import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BackgroundImageProvider extends ChangeNotifier {
  final imagesBox = Hive.box('images');

  get currentImageUrl => imagesBox.get('background_image');

  Future<void> toggleImage(String imageUrl) async {
    await imagesBox.put('background_image', imageUrl);
    notifyListeners();
  }
}
