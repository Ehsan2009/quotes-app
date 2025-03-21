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
    required this.index,
  });

  final String imageUrl;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image preview
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
            fadeInDuration:
                Duration(milliseconds: 100), // Reduce fade-in duration
            errorWidget: (context, url, error) => Center(
              child: Icon(Icons.error, color: Colors.red),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Price and description
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(128, 0, 0, 0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "باز کردن با قیمت ۲,۰۰۰ تومان",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  "این پس‌زمینه ویژه را باز کنید تا تجربه خود را شخصی‌سازی کنید",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
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
                            sku: 'background${index + 1}',
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
                                  child: Text(
                                      "پرداخت ناموفق بود. دوباره تلاش کنید"),
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
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
