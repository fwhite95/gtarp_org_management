import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:org_management/src/screens/dashboard/main_screen.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          name: 'dashboard',
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const MainScreen();
          }),
    ],
  );
}
