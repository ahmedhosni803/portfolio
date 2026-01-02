import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/constants/app_data.dart';
import '../core/utils/layout_utils.dart';
import '../theme/app_theme.dart';

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
          const SizedBox(height: 10),
          InkWell(
            onTap: () async {
              await launchUrl(Uri.parse('tel:${AppData.contactPhone}'));
            },
            child: Text(
              AppData.contactPhone,
              style: AppTheme.bodyText.copyWith(color: AppTheme.primaryPurple),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialButton(
                icon: BoxIcons.bxl_medium,
                onTap: () async {
                  await launchUrl(Uri.parse(AppData.mediumUrl));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.onTap});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? AppTheme.primaryPurple : Colors.grey.shade800,
              width: 1,
            ),
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? Colors.white : Colors.grey,
            size: 24,
          ),
        ),
      ),
    );
  }
}
