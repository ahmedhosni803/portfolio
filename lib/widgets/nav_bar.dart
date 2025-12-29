import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../core/constants/routes.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants/app_data.dart';

import '../core/utils/layout_utils.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: LayoutUtils.getHorizontalPadding(context),
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF190B2D).withValues(alpha: 0.9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 22,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo or Brand Name (optional, implied by Spacer currently)
          const Spacer(),

          if (LayoutUtils.isMobile(context))
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavItem(
                  title: 'Home',
                  onTap: () => Navigator.pushNamed(context, Routes.home),
                ),
                const SizedBox(width: 40),
                _NavItem(
                  title: 'About',
                  onTap: () => Navigator.pushNamed(context, Routes.about),
                ),
                const SizedBox(width: 40),
                _NavItem(
                  title: 'Projects',
                  onTap: () => Navigator.pushNamed(context, Routes.projects),
                ),
                const SizedBox(width: 40),
                _NavItem(
                  title: 'My CV',
                  onTap: () async {
                    final uri = Uri.parse(AppData.cvUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(title, style: AppTheme.navLink),
      ),
    );
  }
}
