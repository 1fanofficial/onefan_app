import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/profile/views/profile_screen.dart';

class ProfileRouteProvider {
  static final List<RouteBase> routes = [
    GoRoute(
      path: '/profile',
      name: RouteName.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
  ];
}
