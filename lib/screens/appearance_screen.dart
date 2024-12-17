import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/appearance_grid_item.dart';
import 'package:quotes_app/data/appearance_data.dart';
import 'package:quotes_app/providers/appearance_provider.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppearanceProvider>(
      builder: (context, appearanceProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('نمایه‌ها'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: appearanceData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 60 / 100,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              itemBuilder: (context, index) {
                return AppearanceGridItem(
                  imageUrl: appearanceData[index]['imageUrl'],
                  textFont: appearanceData[index]['textFont'],
                  textColor: appearanceData[index]['textColor'],
                  isSelected:
                      appearanceProvider.imageUrl == appearanceData[index]['imageUrl']
                          ? true
                          : false,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
