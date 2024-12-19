import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/image_grid_item.dart';
import 'package:quotes_app/providers/background_image_provider.dart';
import 'package:quotes_app/services/supabase_services.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  final supabaseServices = SupabaseServices();
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    getImages();
  }

  void getImages() async {
    final fetchedImages = await supabaseServices.fetchImages();
    setState(() {
      images = fetchedImages
          .where((url) =>
              url.isNotEmpty && !url.contains('.emptyFolderPlaceholder'))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BackgroundImageProvider>(
      builder: (context, backgroundImageProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('نمایه‌ها'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 60 / 100,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              itemBuilder: (context, index) {
                final imagesBox = Hive.box('images');
                final unlockedImages = List<String>.from(imagesBox.get('unlocked_images'));
                
                return ImageGridItem(
                  imageUrl: images[index],
                  isSelected: backgroundImageProvider.currentImageUrl == images[index]
                      ? true
                      : false,
                  isUnlocked: unlockedImages.contains(images[index]),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
