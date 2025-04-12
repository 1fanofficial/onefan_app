import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/features/splash/splash_screen.dart';

class AppRouter {
  static final _rootNavigtorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigtorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text("Page not found"),
      ),
    ),
  );
}
