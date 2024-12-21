import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/app_constants.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/providers/theme_provider.dart';

class FavoriteGridItem extends StatelessWidget {
  const FavoriteGridItem({
    super.key,
    required this.quote,
    required this.favoritesBox,
    required this.index,
  });

  final Quote quote;
  final Box<Quote> favoritesBox;
  final int index;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode();

    final random = Random();
    final colors =
        isDarkMode ? AppConstants.darkColors : AppConstants.lightColors;
    final color = colors[random.nextInt(colors.length)];

    return Stack(
      children: [
        Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  quote.text.replaceAll('.', ''),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  quote.author,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () async {
              await favoritesBox.deleteAt(index);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromARGB(128, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
