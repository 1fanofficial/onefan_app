import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/auth/views/sign_in_screen.dart';
import 'package:onefan_app/features/auth/views/sign_up_screen.dart';

class AuthRouteProvider {
  static final List<RouteBase> routes = [
    GoRoute(
      path: '/signin',
      name: RouteName.signin,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: RouteName.signup,
      builder: (context, state) => const SignUpScreen(),
    ),
  ];
}
