import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/quote_tile.dart';
import 'package:quotes_app/providers/appearance_provider.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppearanceProvider>(
      builder: (context, appearanceProvider, child) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Image.network(
                  appearanceProvider.imageUrl,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: CarouselSlider.builder(
                    itemCount: 10,
                    itemBuilder: (context, index, realIndex) {
                      return QuoteTile();
                    },
                    options: CarouselOptions(
                      scrollDirection: Axis.vertical,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 60),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: 1,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
