import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quotes_app/models/quote.dart';

class QuoteTile extends StatefulWidget {
  const QuoteTile({
    super.key,
    required this.quote,
    required this.onShareQuote,
    required this.isSharing,
  });

  final Quote quote;
  final void Function() onShareQuote;
  final bool isSharing;

  @override
  State<QuoteTile> createState() => _QuoteTileState();
}

class _QuoteTileState extends State<QuoteTile> {
  final favoritesBox = Hive.box<Quote>('favoriteQuotes');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: favoritesBox.listenable(),
      builder: (context, Box<Quote> box, child) {
        final isFavorite = box.containsKey(widget.quote.id);

        return Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(128, 0, 0, 0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    widget.quote.text.replaceAll('.', ''),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(128, 0, 0, 0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    widget.quote.author,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 10,
              bottom: 100,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(128, 0, 0, 0),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  spacing: 12,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (isFavorite) {
                          favoritesBox.delete(widget.quote.id);
                        } else {
                          favoritesBox.put(
                            widget.quote.id,
                            Quote(
                              text: widget.quote.text,
                              author: widget.quote.author,
                            ),
                          );
                        }
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                        size: 36,
                      ),
                    ),
                    widget.isSharing
                        ? CircularProgressIndicator()
                        : GestureDetector(
                            onTap: widget.onShareQuote,
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
