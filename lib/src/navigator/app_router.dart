import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:org_management/src/screens/admin/admin_main.dart';
import 'package:org_management/src/screens/admin/admin_screen.dart';
import 'package:org_management/src/screens/dashboard/main_screen.dart';
import 'package:org_management/src/screens/sign_in/sign_in.dart';
import 'package:org_management/src/screens/weed/weed_stats_main.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          name: 'dashboard',
          path: '/dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const MainScreen();
          }),
      GoRoute(
          name: 'signIn',
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return SignInScreen();
          }),
      GoRoute(
          name: 'weed_stats',
          path: '/weed_stats',
          builder: (BuildContext context, GoRouterState state) {
            return const WeedStatsMain();
          }),
      GoRoute(
          name: 'admin',
          path: '/admin',
          builder: (BuildContext context, GoRouterState state) {
            return const AdminMain();
          }),
    ],
  );
}
