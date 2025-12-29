import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../core/constants/app_data.dart';
import '../core/constants/routes.dart';

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
            onTap: () => Navigator.pushNamed(context, Routes.home),
          ),
          _DrawerItem(
            title: 'About',
            onTap: () => Navigator.pushNamed(context, Routes.about),
          ),
          _DrawerItem(
            title: 'Projects',
            onTap: () => Navigator.pushNamed(context, Routes.projects),
          ),
          _DrawerItem(
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
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: AppTheme.navLink),
      onTap: onTap,
    );
  }
}
