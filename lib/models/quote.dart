import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';

part 'quote.g.dart';

@HiveType(typeId: 1)
class Quote {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final String author;

  Quote({
    String? id,
    required this.text, 
    required this.author,
  }) : id = id ?? _generateId(text, author);

  static String _generateId(String text, String author) {
    final data = utf8.encode('$text|$author'); // Combine text and author
    return sha256.convert(data).toString();   // Create a SHA-256 hash
  }
}