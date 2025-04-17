import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/race_calendar/views/race_calendar_screen.dart';

class RaceCalendarRouteProvider {
  static final List<RouteBase> routes = [
    GoRoute(
      path: '/raceCalendar',
      name: RouteName.raceCalendar,
      builder: (context, state) => const RaceCalendarScreen(),
    ),
  ];
}
