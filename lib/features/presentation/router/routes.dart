import 'package:flutter/material.dart';
import 'package:flutterbaseapp/features/presentation/layouts/auth_layout.dart';
import 'package:flutterbaseapp/features/presentation/layouts/main_layout.dart';
import 'package:flutterbaseapp/features/presentation/screens/auth/login_screen.dart';
import 'package:flutterbaseapp/features/presentation/screens/auth/register_screen.dart';
import 'package:flutterbaseapp/features/presentation/screens/home/home_screen.dart';
import 'package:flutterbaseapp/features/presentation/screens/splash/splash_screen.dart';
import 'package:flutterbaseapp/features/presentation/screens/user/user_screen.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

@TypedGoRoute<RegisterRoute>(path: RegisterRoute.path)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();
  static const path = '/register';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthLayout(title: "Registrarse", child: RegisterScreen());
  }
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthLayout(title: "Iniciar sesión", child: LoginScreen());
  }
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainLayout(child: HomeScreen());
  }
}

@TypedGoRoute<UserRoute>(path: UserRoute.path)
class UserRoute extends GoRouteData {
  const UserRoute();
  static const path = '/user';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainLayout(child: UserScreen());
  }
}
