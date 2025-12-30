import 'package:flutter/material.dart';

import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/nav_bar.dart';

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
            const SizedBox(height: 50),
            const AboutSection(),
            const ExperienceSection(),
            const SizedBox(height: 50),
            const ContactSection(),
          ],
        ),
      ),
    );
  }
}
