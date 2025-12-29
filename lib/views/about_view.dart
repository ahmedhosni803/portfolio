import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/mobile_drawer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MobileDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            const SizedBox(height: 100),
            Text(
              "About Me",
              style: AppTheme.heroTitle,
            ).animate().fadeIn().slideY(),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              constraints: const BoxConstraints(maxWidth: 800),
              child: Text(
                "I am a passionate software engineer with a love for clean code and user-centric design. My journey began 3 years ago...",
                style: AppTheme.bodyText.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ).animate().fadeIn(delay: 200.ms),
          ],
        ),
      ),
    );
  }
}
