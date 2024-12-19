import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/providers/background_image_provider.dart';
import 'package:shimmer/shimmer.dart';

class ImageGridItem extends StatelessWidget {
  const ImageGridItem({
    super.key,
    required this.imageUrl,
    required this.isSelected,
    required this.isUnlocked,
  });

  final String imageUrl;
  final bool isSelected;
  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected) return;
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () async {
                // Access the existing AppearanceProvider instance
                final backgroundImageProvider =
                    Provider.of<BackgroundImageProvider>(context,
                        listen: false);

                // Toggle appearance (change background image)
                await backgroundImageProvider.toggleImage(imageUrl);
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'تغییر نمایه',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: isSelected
            ? BoxDecoration(
                border: Border.all(color: Colors.green.shade900, width: 1),
                borderRadius: BorderRadius.circular(16),
              )
            : null,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade500,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors
                        .grey.shade700, // A solid color to simulate the image
                  ),
                ),
                maxHeightDiskCache: 1000,
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
              if (!isUnlocked)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(128, 0, 0, 0),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)),
                    ),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
