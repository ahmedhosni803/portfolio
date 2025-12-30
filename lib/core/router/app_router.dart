import 'package:flutter/material.dart';

import '../../views/about_view.dart';
import '../../views/home_view.dart';
import '../../views/projects_view.dart';
import '../constants/routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _fadeRoute(const HomeView());
      case Routes.about:
        return _fadeRoute(const AboutView());
      case Routes.projects:
        return _fadeRoute(const ProjectsView());
      default:
        // Default fallback to Home
        return _fadeRoute(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static PageRouteBuilder _fadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
