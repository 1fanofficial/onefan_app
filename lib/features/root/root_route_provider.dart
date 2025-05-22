import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/contests/views/contests_screen.dart';
import 'package:onefan_app/features/home/views/home_screen.dart';
import 'package:onefan_app/features/user_profile/views/user_profile_screen.dart';
import 'package:onefan_app/features/race_calendar/views/race_calendar_screen.dart';
import 'package:onefan_app/features/root/views/root_screen.dart';

class RootRouteProvider {
  static final RouteBase route = ShellRoute(
    builder: (context, state, child) => RootScreen(child: child),
    routes: [
      GoRoute(
        path: '/home',
        name: RouteName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/contests',
        name: RouteName.contests,
        builder: (context, state) => const ContestsScreen(),
      ),
      GoRoute(
        path: '/raceCalendar',
        name: RouteName.raceCalendar,
        builder: (context, state) => const RaceCalendarScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: RouteName.profile,
        builder: (context, state) => const UserProfileScreen(),
      ),
    ],
  );
}
