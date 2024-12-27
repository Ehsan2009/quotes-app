import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/image_grid_item.dart';
import 'package:quotes_app/providers/background_image_provider.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-8moments-1266810_11zon.jpg',
      // 'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-anthony-rodriguez-1836670-3490963.jpg',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-carmen-ong-584272-1353242.jpg?t=2024-12-26T18%3A00%3A51.749Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-dariuskrs-2228160.jpg',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-ezz7-29856764.jpg',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-fede-roveda-1461538-3567348.jpg?t=2024-12-26T18%3A06%3A55.420Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-felipe-perez-239932751-12282043.jpg?t=2024-12-26T18%3A07%3A16.715Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-gokhan-yildiz-384721722-29860619.jpg?t=2024-12-26T18%3A07%3A36.423Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-gokhan-yildiz-384721722-29860628.jpg?t=2024-12-26T18%3A07%3A51.023Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-gsn-travel-28277491.jpg?t=2024-12-26T18%3A08%3A04.737Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-idz95-3273786.jpg?t=2024-12-26T18%3A08%3A19.638Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-james-collington-2147687246-29808922.jpg?t=2024-12-26T18%3A08%3A35.357Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-jeswinthomas-793781.jpg?t=2024-12-26T18%3A08%3A54.708Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-joshua-welch-763172-1624600.jpg?t=2024-12-26T18%3A09%3A14.738Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-julieaagaard-2097103.jpg?t=2024-12-26T18%3A09%3A26.154Z',
      // 'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-luisdelrio-15286.jpg?t=2024-12-26T18%3A09%3A43.524Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-michael-schlierf-757699958-29825254.jpg?t=2024-12-26T18%3A09%3A53.555Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-mihmanduganli-29789623_11zon.jpg?t=2024-12-26T18%3A10%3A03.601Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-packermann-1666012_11zon.jpg?t=2024-12-26T18%3A10%3A15.317Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-pixabay-33545.jpg?t=2024-12-26T18%3A10%3A26.915Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-raditya-jpg-49217389-29872205.jpg?t=2024-12-26T18%3A10%3A38.821Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-rifkyilhamrd-788200.jpg?t=2024-12-26T18%3A10%3A48.576Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-ryank-19727180.jpg?t=2024-12-26T18%3A11%3A02.301Z',
      // 'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-tasveerwala-2861854.jpg?t=2024-12-26T18%3A11%3A14.080Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-tobiasbjorkli-1559821.jpg?t=2024-12-26T18%3A11%3A24.829Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-tomas-anunziata-129267-695214.jpg?t=2024-12-26T18%3A11%3A35.782Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-trupert-1032650.jpg?t=2024-12-26T18%3A11%3A46.382Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-yassinchykry-29882512.jpg?t=2024-12-26T18%3A11%3A58.056Z',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-yassinchykry-29882539.jpg',
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-yunustug-29821056.jpg',
    ];

    return Consumer<BackgroundImageProvider>(
      builder: (context, backgroundImageProvider, child) {
        final imagesBox = Hive.box('images');
        final unlockedImages =
            List<String>.from(imagesBox.get('unlocked_images'));

        print(images.length);
        return Scaffold(
          appBar: AppBar(
            title: Text('پس‌زمینه‌ها'),
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
                return ImageGridItem(
                  imageUrl: images[index],
                  isSelected:
                      backgroundImageProvider.currentImageUrl == images[index]
                          ? true
                          : false,
                  isUnlocked: unlockedImages.contains(images[index]),
                  index: index,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
