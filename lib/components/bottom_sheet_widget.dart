import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myket_iap/myket_iap.dart';
import 'package:myket_iap/util/iab_result.dart';
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
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 330,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) {
                    final downloaded = progress.downloaded.toDouble();
                    final total = progress.totalSize?.toDouble() ?? 1.0;
                    final percentage = (downloaded / total) * 100;

                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.grey.shade700,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: downloaded / total,
                              color: Colors.blue,
                              strokeWidth: 2,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${percentage.toStringAsFixed(0)}%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  maxHeightDiskCache: 1000,
                  errorWidget: (context, url, error) => Center(
                    child: Icon(Icons.error, color: Colors.red),
                  ),
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
                    // Trigger the in-app purchase to unlock the image
                    try {
                      final result = await MyketIAP.launchPurchaseFlow(
                        sku: 'com.ganjsokhan.backgrounds',
                      );

                      IabResult purchaseResult = result[MyketIAP.RESULT];
                      // Purchase purchase = result[MyketIAP.PURCHASE];

                      if (purchaseResult.isSuccess()) {
                        // Successfully purchased the item
                        final backgroundImageProvider =
                            Provider.of<BackgroundImageProvider>(context,
                                listen: false);
                        await backgroundImageProvider.unlockImage(imageUrl);
                        Navigator.of(context).pop();
                      } else {
                        // Handle the failed purchase scenario
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Directionality(
                              textDirection: TextDirection
                                  .rtl, // Set your text direction here
                              child:
                                  Text("پرداخت ناموفق بود. دوباره تلاش کنید"),
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      // Handle errors
                      print('Error during purchase: $e');
                    }
                  },
                  child: const Text("همین حالا باز کنید"),
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
