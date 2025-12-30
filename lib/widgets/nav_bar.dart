import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../core/constants/routes.dart';
import '../core/utils/layout_utils.dart';
import '../theme/app_theme.dart';
import 'cv_preview_dialog.dart';

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
                  icon: EvaIcons.home,
                  onTap: () => Navigator.pushNamed(context, Routes.home),
                ),
                const SizedBox(width: 40),
                _NavItem(
                  title: 'About',
                  icon: EvaIcons.person,
                  onTap: () => Navigator.pushNamed(context, Routes.about),
                ),
                const SizedBox(width: 40),
                _NavItem(
                  title: 'Projects',
                  icon: EvaIcons.briefcase,
                  onTap: () => Navigator.pushNamed(context, Routes.projects),
                ),
                const SizedBox(width: 40),
                _NavItem(
                  title: 'My CV',
                  icon: EvaIcons.file_text,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const CvPreviewDialog(),
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: _isHovered
                    ? const Color(0xFF6C63FF)
                    : Colors.white, // Highlight color
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                widget.title,
                style: AppTheme.navLink.copyWith(
                  color: _isHovered ? Colors.white : Colors.white70,
                  fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
