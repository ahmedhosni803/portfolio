import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/constants/app_data.dart';
import '../core/utils/layout_utils.dart';
import '../theme/app_theme.dart';

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

          // // Experience Section
          // if (AppData.experiences.isNotEmpty) ...[
          //   Text(
          //     "Work Experience",
          //     style: AppTheme.sectionTitle.copyWith(fontSize: 28),
          //   ),
          //   const SizedBox(height: 30),
          //   ...AppData.experiences.map(
          //     (exp) => Padding(
          //       padding: const EdgeInsets.only(bottom: 30),
          //       child: Container(
          //         width: 700,
          //         padding: const EdgeInsets.all(24),
          //         decoration: BoxDecoration(
          //           color: const Color(0xFF172A45),
          //           borderRadius: BorderRadius.circular(12),
          //           border: Border.all(
          //             color: Colors.white.withValues(alpha: 0.05),
          //           ),
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text(
          //                   exp.company,
          //                   style: AppTheme.heroTitle.copyWith(fontSize: 20),
          //                 ),
          //                 Text(
          //                   exp.period,
          //                   style: AppTheme.bodyText.copyWith(
          //                     color: Colors.white60,
          //                     fontSize: 14,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             const SizedBox(height: 4),
          //             Text(
          //               exp.role,
          //               style: AppTheme.bodyText.copyWith(
          //                 color: AppTheme.primaryPurple,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             const SizedBox(height: 12),
          //             Text(
          //               exp.description,
          //               style: AppTheme.bodyText.copyWith(
          //                 color: Colors.white70,
          //                 height: 1.5,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ],

          // Education Section
        ],
      ),
    );
  }
}
