import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/providers/appearance_provider.dart';

class AppearanceGridItem extends StatelessWidget {
  const AppearanceGridItem({
    super.key,
    required this.imageUrl,
    required this.textFont,
    required this.textColor,
    required this.isSelected,
  });

  final String imageUrl;
  final TextStyle textFont;
  final Color textColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected) return;
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () async {
                // Access the existing AppearanceProvider instance
                final appearanceProvider = Provider.of<AppearanceProvider>(context, listen: false);

                // Toggle appearance (change background image)
                await appearanceProvider.toggleAppearance(imageUrl);
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'تغییر نمایه',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: isSelected ? BoxDecoration(
          border: Border.all(color: Colors.green.shade900, width: 1),
          borderRadius: BorderRadius.circular(16),
        ) : null,
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
      ),
    );
  }
}
