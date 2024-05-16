import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:org_management/src/screens/dashboard/main_screen.dart';
import 'package:org_management/src/screens/sign_in/sign_in.dart';

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
    ],
  );
}
