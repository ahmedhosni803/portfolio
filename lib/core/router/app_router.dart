import 'package:flutter/material.dart';
import '../../views/home_view.dart';
import '../../views/about_view.dart';
import '../../views/projects_view.dart';
import '../constants/routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.about:
        return MaterialPageRoute(builder: (_) => const AboutView());
      case Routes.projects:
        return MaterialPageRoute(builder: (_) => const ProjectsView());
      default:
        // Default fallback to Home
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
