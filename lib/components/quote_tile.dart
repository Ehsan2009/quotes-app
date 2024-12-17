import 'package:flutter/material.dart';

class QuoteTile extends StatefulWidget {
  const QuoteTile({super.key});

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
        Center(
          child: Text(
            'Keep Going',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 164,
          child: GestureDetector(
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
        ),
        Positioned(
          right: 24,
          bottom: 140,
          child: Text(
            counter.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 100,
          child: Icon(
            Icons.share,
            color: Colors.white,
            size: 36,
          ),
        ),
      ],
    );
  }
}
