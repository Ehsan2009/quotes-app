import 'package:flutter/material.dart';

class QuoteTile extends StatefulWidget {
  const QuoteTile({
    super.key,
    required this.quote,
    required this.author,
    required this.onShareQuote,
    required this.isSharing,
  });

  final String quote;
  final String author;
  final void Function() onShareQuote;
  final bool isSharing;

  @override
  State<QuoteTile> createState() => _QuoteTileState();
}

class _QuoteTileState extends State<QuoteTile> {
  bool isLiked = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
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
                widget.quote,
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
                widget.author,
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
              spacing: 5,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked ? counter-- : counter++;
                      isLiked = !isLiked;
                    });
                  },
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.white,
                    size: 36,
                  ),
                ),
                Text(
                  counter.toString(),
                  style: TextStyle(color: Colors.white),
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
  }
}
