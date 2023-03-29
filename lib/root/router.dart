import 'package:auth_state_page/ui/navigation/navbar.dart';
import 'package:auth_state_page/ui/page_a.dart';
import 'package:auth_state_page/ui/page_b.dart';
import 'package:auth_state_page/ui/page_c.dart';
import 'package:auth_state_page/ui/page_d.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/a',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/a',
          builder: (BuildContext context, GoRouterState state) {
            return const PageA();
          },
        ),
        GoRoute(
          path: '/b',
          builder: (BuildContext context, GoRouterState state) {
            return const PageB();
          },
        ),
        GoRoute(
          path: '/c',
          builder: (BuildContext context, GoRouterState state) {
            return const PageC();
          },
        ),
        GoRoute(
          path: '/d',
          builder: (BuildContext context, GoRouterState state) {
            return const PageD();
          },
        ),
      ],
    ),
  ],
);
