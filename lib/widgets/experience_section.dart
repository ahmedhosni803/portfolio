import 'package:flutter/material.dart';

import '../core/constants/app_data.dart';
import '../models/experience.dart';
import '../theme/app_theme.dart';
import '../core/utils/layout_utils.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Experience> experiences = AppData.experiences;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Work Experience", style: AppTheme.sectionTitle),
          const SizedBox(height: 40),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return ExperienceCard(experience: experiences[index]);
            },
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final Experience experience;
  const ExperienceCard({super.key, required this.experience});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2B114F), Color(0xFF130328)],
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _isHovered
                ? AppTheme.primaryPurple
                : AppTheme.primaryPurple.withValues(alpha: 0.5),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primaryPurple.withValues(alpha: 0.2),
                    blurRadius: 15,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutUtils.isMobile(context)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.experience.company,
                        style: AppTheme.navLink.copyWith(
                          fontSize: 20,
                        ), // Smaller font for mobile
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.experience.period,
                        style: AppTheme.bodyText.copyWith(fontSize: 14),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.experience.company,
                        style: AppTheme.navLink.copyWith(fontSize: 24),
                      ),
                      Text(widget.experience.period, style: AppTheme.bodyText),
                    ],
                  ),
            const SizedBox(height: 10),
            Text(
              widget.experience.role,
              style: AppTheme.bodyText.copyWith(color: AppTheme.lightPurple),
            ),
            const SizedBox(height: 15),
            Text(widget.experience.description, style: AppTheme.bodyText),
          ],
        ),
      ),
    );
  }
}
