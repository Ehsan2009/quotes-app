import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_app/screens/quotes_screen.dart';
import 'package:quotes_app/screens/settings_screen.dart';
import 'package:quotes_app/screens/tabs_screen.dart';
import 'package:quotes_app/screens/images_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return TabsScreen(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const QuotesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/images_screen',
              builder: (context, state) => const ImagesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings_screen',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
