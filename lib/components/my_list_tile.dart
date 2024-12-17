import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/icon_container.dart';
import 'package:quotes_app/providers/theme_provider.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.isSelected,
    required this.hasArrowForward,
    this.switchValue,
    this.switchOnChanged,
  });

  final void Function() onTap;
  final IconData icon;
  final String title;
  final String? isSelected;
  final bool hasArrowForward;
  final bool? switchValue;
  final void Function(bool)? switchOnChanged;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode();

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      onTap: onTap,
      leading: IconContainer(icon: icon),
      title: Text(
        title,
        style: TextStyle(
          // color: const Color.fromARGB(255, 10, 7, 7),
          color:
              isDarkMode ? Colors.white : const Color.fromARGB(255, 10, 7, 7),
          fontWeight: isSelected == title ? FontWeight.bold : null,
        ),
      ),
      trailing: hasArrowForward
          ? const Icon(Icons.arrow_forward_ios)
          : Switch(
              value: switchValue!,
              onChanged: switchOnChanged,
            ),
    );
  }
}
