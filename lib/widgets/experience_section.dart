import 'package:flutter/material.dart';

import '../core/constants/app_data.dart';
import '../core/utils/layout_utils.dart';
import '../models/experience.dart';
import '../theme/app_theme.dart';

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
          if (AppData.education.isNotEmpty) ...[
            Text(
              "Education",
              style: AppTheme.sectionTitle.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 30),
            ...AppData.education.map(
              (edu) => Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: 700,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              edu['degree']!,
                              style: AppTheme.heroTitle.copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              edu['institution']!,
                              style: AppTheme.bodyText.copyWith(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          edu['date']!,
                          style: AppTheme.bodyText.copyWith(
                            color: AppTheme.primaryPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _isHovered
                ? [
                    const Color(0xFF452775),
                    const Color(0xFF2E1250),
                  ] // Brighter on hover
                : [const Color(0xFF2B114F), const Color(0xFF130328)],
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _isHovered
                ? AppTheme.primaryPurple
                : AppTheme.primaryPurple.withValues(alpha: 0.3),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primaryPurple.withValues(alpha: 0.4),
                    blurRadius: 30,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: AppTheme.primaryPurple.withValues(alpha: 0.2),
                    blurRadius: 10,
                    spreadRadius: -5,
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
