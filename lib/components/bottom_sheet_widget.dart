import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/providers/background_image_provider.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final backgroundImageProvider =
            Provider.of<BackgroundImageProvider>(context, listen: false);

        await backgroundImageProvider.toggleImage(imageUrl);
        Navigator.of(context).pop();
      },
      child: Container(
        width: double.infinity,
        // height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            // Image preview
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  height: 330,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Price and description
            Text(
              "باز کردن با قیمت ۲,۰۰۰ تومان",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              "این پس‌زمینه ویژه را باز کنید تا تجربه خود را شخصی‌سازی کنید",
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
            const SizedBox(height: 16),

            // Buttons for actions
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final backgroundImageProvider =
                        Provider.of<BackgroundImageProvider>(context,
                            listen: false);

                    await backgroundImageProvider.unlockImage(imageUrl);

                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "همین حالا باز کنید",
                    style: TextStyle(),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close modal
                  },
                  child: Text(
                    "لغو",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
