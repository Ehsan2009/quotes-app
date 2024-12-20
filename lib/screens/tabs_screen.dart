import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void onTap(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: TabsScreen.scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            gap: 8,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            color: Colors.grey,
            activeColor: Theme.of(context).colorScheme.primary,
            tabBackgroundColor: Theme.of(context).colorScheme.onSecondary,
            // tabBackgroundColor: Colors.grey.shade900,
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                key: Key('Home'),
                icon: Icons.home,
                text: 'خانه',
                onPressed: () {
                  onTap(0);
                },
              ),
              GButton(
                key: Key('Themes'),
                icon: Icons.format_paint_outlined,
                text: 'نمایه‌ها ',
                onPressed: () {
                  onTap(1);
                },
              ),
              GButton(
                key: Key('Settings'),
                icon: Icons.settings,
                text: 'تنظیمات',
                onPressed: () {
                  onTap(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
