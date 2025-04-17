import 'package:go_router/go_router.dart';
import 'package:onefan_app/features/contests/contests_route_provider.dart';
import 'package:onefan_app/features/home/home_route_provider.dart';
import 'package:onefan_app/features/profile/profile_route_provider.dart';
import 'package:onefan_app/features/race_calendar/race_calendar_route_provider.dart';
import 'package:onefan_app/features/root/views/root_screen.dart';

class RootRouteProvider {
  static final RouteBase route = ShellRoute(
    builder: (context, state, child) => RootScreen(child: child),
    routes: [
      ...HomeRouteProvider.routes,
      ...ContestsRouteProvider.routes,
      ...RaceCalendarRouteProvider.routes,
      ...ProfileRouteProvider.routes,
    ],
  );
}
