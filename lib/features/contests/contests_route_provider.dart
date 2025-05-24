import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/contests/views/rank_drivers_screen.dart';
import 'package:onefan_app/features/race_calendar/model/response/race_details_response.dart';

class ContestsRouteProvider {
  static final List<RouteBase> routes = [
    GoRoute(
      path: '/rankDrivers',
      name: RouteName.rankDrivers,
      builder: (context, state) {
        RaceDetailsResponse raceDetails = state.extra as RaceDetailsResponse;
        return RankDriversScreen(raceDetails: raceDetails);
      },
    ),
  ];
}
