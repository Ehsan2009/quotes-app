import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_app/components/quote_tile.dart';
import 'package:video_player/video_player.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  late VideoPlayerController _controller;
  final _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();

    // Initialize the video player
    _controller = VideoPlayerController.asset('assets/videos/background.mp4')
      ..initialize().then((_) {
        // Play video and set it to loop
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final pageController = PageController(initialPage: 0);

  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Stack(
          children: [
            // _controller.value.isInitialized
            //     ? VideoPlayer(_controller)
            //     : Center(child: CircularProgressIndicator()),

            Image.asset(
              'assets/images/background_1.jpg',
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: CarouselSlider.builder(
                itemCount: 10,
                itemBuilder: (context, index, realIndex) {
                  // return QuoteTile(
                  //   title: 'Keep Going',
                  //   imageUrl: 'assets/images/sunset.jpg',
                  // );
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
  }
}
