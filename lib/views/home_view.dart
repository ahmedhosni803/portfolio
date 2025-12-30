import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/about_section.dart';

import '../theme/app_theme.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/nav_bar.dart';
import '../widgets/projects_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MobileDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Background Gradient Blobs
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryPurple.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  radius: 0.6,
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            right: -200,
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryPurple.withOpacity(0.2),
                    Colors.transparent,
                  ],
                  radius: 0.6,
                ),
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Column(
              children: [
                const NavBar(),
                const SizedBox(height: 50),
                const HeroSection(),
                // const SizedBox(height: 50),
                const AboutSection(),
                const SizedBox(height: 34),
                const ExperienceSection(),
                const SizedBox(height: 34),
                const ProjectsSection(),
                const SizedBox(height: 34),
                const ContactSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
