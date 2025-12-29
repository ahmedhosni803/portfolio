import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../core/constants/app_data.dart';

import '../core/utils/layout_utils.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Unused variable removed
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: LayoutUtils.getHorizontalPadding(context),
      ),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTheme.heroTitle.copyWith(fontSize: 40),
              children: [
                TextSpan(text: AppData.aboutTitleStart),
                TextSpan(
                  text: AppData.aboutTitleHighlight,
                  style: TextStyle(color: AppTheme.primaryPurple),
                ),
                const TextSpan(text: '...'),
              ],
            ),
          ).animate().fadeIn(duration: 800.ms).scale(),

          const SizedBox(height: 20),

          Text(
            AppData.aboutSubtitle,
            textAlign: TextAlign.center,
            style: AppTheme.bodyText.copyWith(fontSize: 12),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),

          const SizedBox(height: 30),

          Text(
            AppData.heroDescription, // Using bio description
            textAlign: TextAlign.center,
            style: AppTheme.bodyText.copyWith(
              fontSize: 16,
              height: 1.5,
              color: Colors.white70,
            ),
          ).animate().fadeIn(delay: 400.ms),
        ],
      ),
    );
  }
}
