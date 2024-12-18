import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/appearance_grid_item.dart';
import 'package:quotes_app/providers/appearance_provider.dart';
import 'package:quotes_app/services/supabase_services.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({super.key});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
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
              url != null &&
              url.isNotEmpty &&
              !url.contains('.emptyFolderPlaceholder'))
          .toList();
      ;
    });
  }

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
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 60 / 100,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              itemBuilder: (context, index) {
                return AppearanceGridItem(
                  imageUrl: images[index],
                  isSelected: appearanceProvider.imageUrl == images[index]
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
