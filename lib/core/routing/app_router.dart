import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/auth/auth_route_provider.dart';
import 'package:onefan_app/features/contests/contests_route_provider.dart';
import 'package:onefan_app/features/home/home_route_provider.dart';
import 'package:onefan_app/features/user_profile/user_profile_route_provider.dart';
import 'package:onefan_app/features/race_calendar/race_calendar_route_provider.dart';
import 'package:onefan_app/features/root/root_route_provider.dart';
import 'package:onefan_app/features/splash/splash_screen.dart';

class AppRouter {
  static final rootNavigtorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: rootNavigtorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: RouteName.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      ...AuthRouteProvider.routes,
      ...HomeRouteProvider.routes,
      ...ContestsRouteProvider.routes,
      ...RaceCalendarRouteProvider.routes,
      ...UserProfileRouteProvider.routes,
      RootRouteProvider.route,
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text("Page not found"),
      ),
    ),
  );
}
