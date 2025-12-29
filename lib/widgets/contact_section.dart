import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../core/constants/app_data.dart';

import '../core/utils/layout_utils.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Variables removed
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: LayoutUtils.getHorizontalPadding(context),
      ),
      color: const Color(0xFF190B2D), // Footer color
      child: Column(
        children: [
          Text("Contact", style: AppTheme.sectionTitle),
          const SizedBox(height: 30),
          Text(
            AppData.contactText,
            textAlign: TextAlign.center,
            style: AppTheme.bodyText,
          ),
          const SizedBox(height: 20),
          Text(
            AppData.contactEmail,
            style: AppTheme.bodyText.copyWith(color: AppTheme.primaryPurple),
          ),
        ],
      ),
    );
  }
}
