import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final supabase = Supabase.instance.client;

  Future<List<String>> fetchImages() async {
    try {
      final response = await supabase.storage.from('images').list();

      if (response.isEmpty) {
        print('No images found in the bucket');
        return [];
      }

      List<String> imageUrls = response.map((file) {
        return supabase.storage.from('images').getPublicUrl(file.name);
      }).toList();

      print(imageUrls);

      return imageUrls;
    } catch (error) {
      print('Error fetching images: $error');
      return [];
    }
  }
}
