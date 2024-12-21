import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotes_app/components/favorite_grid_item.dart';
import 'package:quotes_app/models/quote.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<Quote>('favoriteQuotes');

    return Scaffold(
      appBar: AppBar(
        title: Text('علاقه‌مندی‌ها'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: favoritesBox.listenable(),
        builder: (context, Box<Quote> box, child) {
          if (box.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('هیچ نقل‌قولی در لیست علاقه‌مندی‌ها وجود ندارد', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: favoritesBox.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 70 / 100,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final quote = favoritesBox.getAt(index);

                return FavoriteGridItem(
                  quote: quote!,
                  favoritesBox: favoritesBox,
                  index: index,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
