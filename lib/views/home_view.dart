import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/about_section.dart';
import 'package:portfolio_app/widgets/interactive_particle_background.dart';

import '../theme/app_theme.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/nav_bar.dart';
import '../widgets/projects_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ValueNotifier<Offset?> _mousePos = ValueNotifier(null);

  @override
  void dispose() {
    _mousePos.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MobileDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: MouseRegion(
        onHover: (event) => _mousePos.value = event.localPosition,
        onExit: (event) => _mousePos.value = null,
        child: Stack(
          children: [
            // Interactive Particle Background
            InteractiveParticleBackground(
              numberOfParticles: 100,
              particleColor: AppTheme.primaryColor,
              mousePosition: _mousePos,
            ),

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
                      AppTheme.primaryColor.withOpacity(0.3),
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
                      AppTheme.primaryColor.withOpacity(0.2),
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
      ),
    );
  }
}
