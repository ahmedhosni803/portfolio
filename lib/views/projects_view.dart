import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/projects_section.dart'; // Reuse ProjectCard
import '../core/constants/app_data.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

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
              "All Projects",
              style: AppTheme.heroTitle,
            ).animate().fadeIn().slideY(),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              constraints: const BoxConstraints(maxWidth: 1200),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppData.projects.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 80),
                itemBuilder: (context, index) {
                  return ProjectCard(
                    project: AppData.projects[index],
                    index: index,
                  );
                },
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
