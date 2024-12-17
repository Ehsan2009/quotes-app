import 'package:flutter/material.dart';

class ThemeGridItem extends StatelessWidget {
  const ThemeGridItem({
    super.key,
    required this.imageUrl,
    required this.textFont,
    required this.textColor,
  });

  final String imageUrl;
  final TextStyle textFont;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade900, width: 1),
        borderRadius:
            BorderRadius.circular(16),
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text(
                'الفبا',
                style: textFont.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class ThemeGridItem extends StatelessWidget {
//   const ThemeGridItem({
//     super.key,
//     required this.imageUrl,
//     required this.textFont,
//     required this.textColor,
//   });

//   final String imageUrl;
//   final TextStyle textFont;
//   final Color textColor;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.hardEdge,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.green, width: 1),
//       ),
//       child: Stack(
//         children: [
//           Image.asset(
//             imageUrl,
//             height: double.infinity,
//             fit: BoxFit.fill,
//           ),
//           Center(
//             child: Text(
//               'الفبا',
//               style: textFont.copyWith(
//                 color: textColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
