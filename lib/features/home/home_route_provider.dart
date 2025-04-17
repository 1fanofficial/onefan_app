import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/home/views/home_screen.dart';

class HomeRouteProvider {
  static final List<RouteBase> routes = [
    GoRoute(
      path: '/home',
      name: RouteName.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ];
}
