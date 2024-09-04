import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lod_laos/splash_screen.dart';
import 'package:lod_laos/views/screens/home/home_screen.dart';
import 'package:lod_laos/views/screens/settings/setting_screen.dart';

abstract class PageName {
  static const String splashRoute = '/';
  static const String homeScreenRoute = '/home_screen';
  static const String settingRoute = '/setting_screen';
  static const String navigationRoute = '/navigation_screen';
  static const String landingViewRoute = '/landing_view';
  static const String signInRoute = '/sign_in_screen';
  static const String signUpRoute = '/sign_up_screen';
}

GoRouter router = GoRouter(
  initialLocation: PageName.splashRoute,
  routes: [
    GoRoute(
      path: PageName.splashRoute,
      builder: (context, state) => const SplashScreen(),
      // routes: ,
    ),
    GoRoute(
      path: PageName.homeScreenRoute,
      builder: (context, state) => const HomeScreen(
        key: Key(PageName.homeScreenRoute),
      ),
    ),
    GoRoute(
      path: PageName.settingRoute,
      builder: (context, state) => const SettingScreen(),
    ),
  ],
);

class AppRoutes {}
