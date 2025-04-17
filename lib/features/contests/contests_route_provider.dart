import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/contests/views/contests_screen.dart';

class ContestsRouteProvider {
  static final List<RouteBase> routes = [
    GoRoute(
      path: '/contests',
      name: RouteName.contests,
      builder: (context, state) => const ConstestsScreen(),
    ),
  ];
}
