import 'package:flutter/material.dart';
import 'package:quotes_app/components/theme_grid_item.dart';
import 'package:quotes_app/data/themes_data.dart';

class ThemesScreen extends StatelessWidget {
  const ThemesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نمایه‌ها'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: themesData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 60 / 100,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
          ),
          itemBuilder: (context, index) {
            return ThemeGridItem(
              imageUrl: themesData[index]['imageUrl'],
              textFont: themesData[index]['textFont'],
              textColor: themesData[index]['textColor'],
            );
          },
        ),
      ),
    );
  }
}
