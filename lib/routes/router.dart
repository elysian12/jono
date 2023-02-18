import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jono/modules/splash/views/onboarding_page.dart';

import '../modules/modules.dart';
import '../modules/profile/profile_page.dart';

class MyRouter {
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Route Not Defined'),
        ),
      );
    });
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    log(settings.name!);
    final args = settings.arguments;

    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case SplashPage.routeName:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case OnboardingPage.routeName:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case LandingPage.routeName:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case SignupPage.routeName:
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case BottomPage.routeName:
        return MaterialPageRoute(builder: (_) => const BottomPage());

      default:
        return _errorRoute();
    }
  }
}
