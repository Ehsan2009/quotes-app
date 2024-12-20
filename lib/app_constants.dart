import 'package:flutter/material.dart';

class AppConstants {
  static const supabaseUrl = 'https://acurzzhfvsuymnvoafei.supabase.co';
  static const supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFjdXJ6emhmdnN1eW1udm9hZmVpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ0OTMwNzAsImV4cCI6MjA1MDA2OTA3MH0.jlTQ7ElrkBN4qE3ZcFba92YtF-cG9R7YBAz1bSTXR48';

  static const defaultBackgroundImageUrl =
      'https://acurzzhfvsuymnvoafei.supabase.co/storage/v1/object/public/images/pexels-8moments-1266810_11zon.jpg';

  static const List<Color> darkColors = [
    Color(0xFF212121), // Dark Grey
    Color(0xFF1C1C1C), // Charcoal
    Color(0xFF263238), // Blue Grey
    Color(0xFF37474F), // Dark Blue Grey
    Color(0xFF455A64), // Blue Steel
    Color(0xFF546E7A), // Light Blue Grey
    Color(0xFF607D8B), // Slate Blue
    Color(0xFF78909C), // Light Charcoal Blue
    Color(0xFF90A4AE), // Muted Blue
    Color(0xFFB0BEC5), // Soft Blue
    Color(0xFF263238), // Deep Grey Blue
    Color(0xFF1976D2), // Dark Blue
    Color(0xFF1565C0), // Royal Blue
    Color(0xFF0288D1), // Dark Sky Blue
    Color(0xFF039BE5), // Sky Blue
    Color(0xFF0288D1), // Ocean Blue
    Color(0xFF0277BD), // Teal Blue
    Color(0xFF01579B), // Navy Blue
    Color(0xFF003c8f), // Midnight Blue
    Color(0xFF3E2723), // Dark Brown
    Color(0xFF3E1B18), // Deep Red Brown
    Color(0xFF4E342E), // Muted Brown
    Color(0xFF5D4037), // Coffee Brown
    Color(0xFF6D4C41), // Rustic Brown
    Color(0xFF795548), // Dark Tan
    Color(0xFF8D6E63), // Warm Brown
    Color(0xFFA1887F), // Beige Brown
    Color(0xFFBCAAA4), // Light Brown
    Color(0xFF2C6B63), // Forest Green
    Color(0xFF1B5E20), // Dark Green
    Color(0xFF4CAF50), // Dark Lime
    Color(0xFF388E3C), // Medium Green
    Color(0xFF2E7D32), // Olive Green
    Color(0xFF1B5E20), // Forest Green
    Color(0xFF8BC34A), // Green
    Color(0xFF7C4DFF), // Purple Blue
    Color(0xFF673AB7), // Dark Purple
    Color(0xFF512DA8), // Dark Violet
    Color(0xFF3F51B5), // Indigo
    Color(0xFF303F9F), // Dark Blue
    Color(0xFF2196F3), // Royal Blue
    Color(0xFF1976D2), // Dark Sky Blue
    Color(0xFF0288D1), // Ocean Blue
    Color(0xFF01579B), // Navy Blue
    Color(0xFFB71C1C), // Dark Red
    Color(0xFFD32F2F), // Red
    Color(0xFF9C27B0), // Dark Purple
    Color(0xFF880E4F), // Dark Raspberry
    Color(0xFF6A1B9A), // Deep Purple
    Color(0xFF4A148C), // Violet
    Color(0xFF3E2723), // Dark Brown
    Color(0xFF795548), // Brown
    Color(0xFF9E9D24), // Olive Green
    Color(0xFF616161), // Grey
    Color(0xFF757575), // Charcoal Grey
    Color(0xFFBDBDBD), // Light Grey
    Color(0xFF616161), // Dark Grey
    Color(0xFF9E9E9E), // Soft Grey
    Color(0xFF424242), // Charcoal
    Color(0xFF303030), // Blackened Grey
    Color(0xFF212121), // Very Dark Grey
    Color(0xFF0D47A1), // Midnight Blue
    Color(0xFF0288D1), // Dark Blue
    Color(0xFF1565C0), // Bright Blue
    Color(0xFF0D47A1), // Navy
    Color(0xFF0277BD), // Ocean Blue
    Color(0xFF4CAF50), // Greenery
    Color(0xFF388E3C), // Forest Green
    Color(0xFF2E7D32), // Fresh Green
    Color(0xFF1B5E20), // Leaf Green
    Color(0xFF9E9D24), // Yellow Green
    Color(0xFFCDDC39), // Lime
    Color(0xFF4CAF50), // Green Lime
    Color(0xFF607D8B), // Slate Blue
    Color(0xFF3E2723), // Rustic Red
    Color(0xFF4E342E), // Dark Earthy Brown
    Color(0xFF8D6E63), // Coffee Brown
    Color(0xFFA1887F), // Light Brown
    Color(0xFFBCAAA4), // Tan
    Color(0xFF8BC34A), // Grass Green
    Color(0xFF7C4DFF), // Purple Blue
    Color(0xFF673AB7), // Violet Blue
    Color(0xFF512DA8), // Purple
    Color(0xFF3F51B5), // Indigo Blue
    Color(0xFF303F9F), // Dark Blue
    Color(0xFF2196F3), // Royal Blue
    Color(0xFF1976D2), // Ocean Blue
    Color(0xFF0288D1), // Azure Blue
    Color(0xFF01579B), // Navy Blue
    Color(0xFF9C27B0), // Purple
    Color(0xFF880E4F), // Dark Raspberry
    Color(0xFF6A1B9A), // Dark Violet
    Color(0xFF4A148C), // Violet Purple
    Color(0xFF3E2723), // Earthy Brown
    Color(0xFF2C6B63), // Jungle Green
    Color(0xFF1B5E20), // Dark Green
    Color(0xFF4CAF50), // Fresh Lime Green
    Color(0xFF388E3C), // Medium Green
    Color(0xFF2E7D32), // Grass Green
    Color(0xFF8BC34A), // Yellow Green
    Color(0xFF607D8B), // Slate Grey
    Color(0xFF3E2723), // Coffee Brown
    Color(0xFF795548), // Coffee
  ];
  static const List<Color> lightColors = [
  Color(0xFFFFF8E1), // Light Cream
  Color(0xFFFFFDE7), // Pale Yellow
  Color(0xFFFFF9C4), // Light Lemon
  Color(0xFFFFF59D), // Soft Yellow
  Color(0xFFFFF176), // Mellow Yellow
  Color(0xFFFFEE58), // Bright Yellow
  Color(0xFFFFEB3B), // Sunflower Yellow
  Color(0xFFFBE9E7), // Light Peach
  Color(0xFFFFCCBC), // Soft Coral
  Color(0xFFFFAB91), // Blush Pink
  Color(0xFFFF8A65), // Peachy Orange
  Color(0xFFFF7043), // Soft Orange
  Color(0xFFFFF3E0), // Creamy White
  Color(0xFFFFE0B2), // Light Apricot
  Color(0xFFFFD180), // Pale Orange
  Color(0xFFFFCC80), // Apricot
  Color(0xFFFFB74D), // Orange Tint
  Color(0xFFFFFDE7), // Pale Butter
  Color(0xFFFFECB3), // Soft Gold
  Color(0xFFFFE082), // Pastel Yellow
  Color(0xFFE1F5FE), // Light Ice Blue
  Color(0xFFB3E5FC), // Light Sky Blue
  Color(0xFF81D4FA), // Soft Cyan
  Color(0xFF80DEEA), // Aqua Tint
  Color(0xFF80CBC4), // Mint Green
  Color(0xFFB2DFDB), // Soft Teal
  Color(0xFFE0F7FA), // Pale Cyan
  Color(0xFFE8F5E9), // Light Mint
  Color(0xFFC8E6C9), // Soft Green
  Color(0xFFA5D6A7), // Light Grass Green
  Color(0xFFDCE775), // Soft Lime
  Color(0xFFF0F4C3), // Light Lime
  Color(0xFFFFF8E1), // Light Vanilla
  Color(0xFFF5F5F5), // Very Light Grey
  Color(0xFFECEFF1), // Soft Ash
  Color(0xFFCFD8DC), // Light Steel
  Color(0xFFB0BEC5), // Pale Silver
  Color(0xFFE3F2FD), // Ice Blue
  Color(0xFFBBDEFB), // Baby Blue
  Color(0xFFFFF3E0), // Ivory
  Color(0xFFFBE9E7), // Soft Pink
  Color(0xFFF8BBD0), // Light Rose
  Color(0xFFFFCCBC), // Light Coral
  Color(0xFFFFD180), // Soft Apricot
  Color(0xFFF3E5F5), // Lilac Tint
  Color(0xFFE1BEE7), // Light Lavender
  Color(0xFFD1C4E9), // Soft Purple
  Color(0xFFB3E5FC), // Soft Cyan
  Color(0xFFBBDEFB), // Light Blue
  Color(0xFFFFECB3), // Light Gold
  Color(0xFFFFE0B2), // Soft Orange
  Color(0xFFFFF59D), // Pale Lemon
  Color(0xFFFFF9C4), // Light Yellow
  Color(0xFFFFF8E1), // Light Butter
  Color(0xFFF0F4C3), // Lemon Tint
  Color(0xFFE6EE9C), // Soft Lime
  Color(0xFFDCEDC8), // Light Grass Green
  Color(0xFFC5E1A5), // Soft Lime Green
  Color(0xFFAED581), // Light Olive
  Color(0xFFD7CCC8), // Pale Brown
  Color(0xFFDADADA), // Silver Gray
  Color(0xFFEBEBEB), // Light Gray
  Color(0xFFF9F9F9), // Almost White
  Color(0xFFFFF0E0), // Cream Tint
  Color(0xFFFFD6C4), // Peach Glow
  Color(0xFFFFEEDC), // Warm Ivory
  Color(0xFFF7E8E8), // Rose Mist
  Color(0xFFF0E0FF), // Lavender Mist
  Color(0xFFDFF9FB), // Pale Aqua
  Color(0xFFF0FFF0), // Light Mint
  Color(0xFFFFF7DF), // Butter Glow
  Color(0xFFFAF4DD), // Soft Vanilla
  Color(0xFFF2F2F2), // Soft White
  Color(0xFFE8E8E8), // Light Silver
  Color(0xFFEDEDED), // Warm Gray
  Color(0xFFFBF3EB), // Pastel Peach
  Color(0xFFFCF4E9), // Soft Cream
  Color(0xFFF9E4D4), // Peachy Tint
  Color(0xFFFFF3D9), // Pale Yellow
  Color(0xFFF5F2D9), // Subtle Butter
  Color(0xFFDEE6E8), // Cool Silver
  Color(0xFFF3EFEF), // Pale Rose
  Color(0xFFF3FAF9), // Mint Glow
  Color(0xFFFFFAE0), // Buttercream
  Color(0xFFF3F9F1), // Subtle Mint
  Color(0xFFEBF7F7), // Aqua Frost
  Color(0xFFFDF3FA), // Misty Pink
  Color(0xFFFBF3FC), // Subtle Lavender
  Color(0xFFF3FAFC), // Light Blue Mist
  Color(0xFFF3FFF3), // Soft Mint Glow
];
}


