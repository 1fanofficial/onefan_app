import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/contests/views/rank_drivers_screen.dart';

class ContestsRouteProvider {
  static final List<RouteBase> routes = [
    GoRoute(
      path: '/rankDrivers',
      name: RouteName.rankDrivers,
      builder: (context, state) => const RankDriversScreen(),
    ),
  ];
}
