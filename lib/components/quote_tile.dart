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
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color.fromARGB(128, 0, 0, 0),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Text(
              'Keep Going \n hi \n hi',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
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
                Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 36,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
