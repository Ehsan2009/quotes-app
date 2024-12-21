import 'dart:io';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/quote_tile.dart';
import 'package:quotes_app/data/quotes_data.dart';
import 'package:quotes_app/providers/background_image_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final ScreenshotController screenshotController = ScreenshotController();
  var isSharing = false;
  final shuffledQuotes = [...quotesList]..shuffle();

  void shareQuote() async {
    setState(() {
      isSharing = true;
    });

    // Capture the screenshot
    Uint8List? image = await screenshotController.capture();
    if (image != null) {
      // Save and share the screenshot
      final directory = await getTemporaryDirectory();
      final imagePath = File('${directory.path}/screenshot.png');
      await imagePath.writeAsBytes(image);

      Share.shareXFiles([XFile(imagePath.path)], text: "Check out this quote!");
    }

    setState(() {
      isSharing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Consumer<BackgroundImageProvider>(
        builder: (context, backgroundImageProvider, child) {
          return Scaffold(
            body: Stack(
              children: [
                Image.network(
                  backgroundImageProvider.currentImageUrl,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: CarouselSlider.builder(
                    itemCount: shuffledQuotes.length,
                    itemBuilder: (context, index, realIndex) {
                      return QuoteTile(
                        quote: shuffledQuotes[index],
                        onShareQuote: shareQuote,
                        isSharing: isSharing,
                      );
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
          );
        },
      ),
    );
  }
}
