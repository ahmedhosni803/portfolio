import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../core/constants/routes.dart';
import '../theme/app_theme.dart';
import 'cv_preview_dialog.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF190B2D),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF2B114F)),
            child: Center(child: Text('Menu', style: AppTheme.sectionTitle)),
          ),
          _DrawerItem(
            title: 'Home',
            icon: Iconsax.home_outline,
            onTap: () => Navigator.pushNamed(context, Routes.home),
          ),
          _DrawerItem(
            title: 'About',
            icon: Iconsax.user_outline,
            onTap: () => Navigator.pushNamed(context, Routes.about),
          ),
          _DrawerItem(
            title: 'Projects',
            icon: Iconsax.briefcase_outline,
            onTap: () => Navigator.pushNamed(context, Routes.projects),
          ),
          _DrawerItem(
            title: 'My CV',
            icon: Iconsax.document_download_outline,
            onTap: () {
              Navigator.pop(context); // Close drawer
              showDialog(
                context: context,
                builder: (context) => const CvPreviewDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: AppTheme.navLink),
      onTap: onTap,
    );
  }
}
