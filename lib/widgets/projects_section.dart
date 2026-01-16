import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/constants/app_data.dart';
import '../core/constants/routes.dart';
import '../core/utils/layout_utils.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = AppData.projects;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: LayoutUtils.getHorizontalPadding(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Featured Projects", style: AppTheme.sectionTitle),
          const SizedBox(height: 40),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            separatorBuilder: (context, index) => const SizedBox(height: 80),
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index], index: index);
            },
          ),
          const SizedBox(height: 40),
          Center(
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, Routes.projects),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppTheme.primaryColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text("View All Projects", style: AppTheme.navLink),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  const ProjectCard({super.key, required this.project, required this.index});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  Offset _mousePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    bool isMobile = LayoutUtils.isMobile(context);
    // On desktop, alternate alignment: even index -> image left, odd index -> image right
    bool isImageRight = widget.index % 2 != 0;

    if (isMobile) {
      return _MobileProjectCard(project: widget.project);
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      onHover: (event) {
        setState(() {
          _mousePosition = event.localPosition;
        });
      },
      cursor: SystemMouseCursors.click,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 1000,
        ), // Limit width on large screens
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              // Image Layer
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: isImageRight ? null : (_isHovered ? 10 : 0),
                right: isImageRight ? (_isHovered ? 10 : 0) : null,
                top: 0,
                bottom: 0,
                width: MediaQuery.of(context).size.width > 900 ? 600 : 500,
                child: AnimatedScale(
                  scale: _isHovered ? 1.005 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: _isHovered
                              ? AppTheme.primaryColor.withValues(alpha: 0.4)
                              : Colors.black.withValues(alpha: 0.2),
                          blurRadius: _isHovered ? 30 : 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(widget.project.imageUrl),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          AppTheme.primaryColor.withValues(
                            alpha: _isHovered ? 0.1 : 0.2,
                          ), // Tint reveals on hover
                          BlendMode.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Content Layer
              Positioned(
                left: isImageRight ? 0 : null,
                right: isImageRight ? null : 0,
                top: 0,
                bottom: 0,
                width: 500, // Content width
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: isImageRight
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Featured Project',
                      style: AppTheme.bodyText.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project.title,
                      style: AppTheme.heroTitle.copyWith(fontSize: 28),
                      textAlign: isImageRight
                          ? TextAlign.left
                          : TextAlign.right,
                    ),
                    const SizedBox(height: 20),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(25),
                      transform: _isHovered
                          ? (Matrix4.identity()
                              ..translate(isImageRight ? 5.0 : -5.0))
                          : Matrix4.identity(),
                      decoration: BoxDecoration(
                        color: const Color(0xFF172A45), // Dark card color
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Text(
                        widget.project.description,
                        style: AppTheme.bodyText,
                        textAlign: isImageRight
                            ? TextAlign.left
                            : TextAlign.right,
                      ),
                    ),

                    // Tech Stack (Placeholder logic since we don't have tech list in model yet)
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: isImageRight
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: widget.project.links.map((link) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: isImageRight
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                            children: [
                              if (widget.project.links.length > 1)
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    "${link.title}:",
                                    style: AppTheme.bodyText.copyWith(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (link.googlePlay != null)
                                _StoreButton(
                                  icon: Icons.android,
                                  url: link.googlePlay!,
                                ),
                              const SizedBox(width: 10),
                              if (link.appleStore != null)
                                _StoreButton(
                                  icon: Icons.apple,
                                  url: link.appleStore!,
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              // Spotlight Layer (Mouse Light Effect)
              //   if (_isHovered)
              //     Positioned.fill(
              //       child: IgnorePointer(
              //         child: LayoutBuilder(
              //           builder: (context, constraints) {
              //             // Avoid division by zero
              //             if (constraints.maxWidth == 0 ||
              //                 constraints.maxHeight == 0) {
              //               return const SizedBox();
              //             }

              //             // Calculate relative alignment (-1.0 to 1.0)
              //             final dx =
              //                 (_mousePosition.dx / constraints.maxWidth) * 2 - 1;
              //             final dy =
              //                 (_mousePosition.dy / constraints.maxHeight) * 2 - 1;

              //             return Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(14),
              //                 gradient: RadialGradient(
              //                   center: Alignment(dx, dy),
              //                   radius: 0.3, // Adjust spotlight size
              //                   colors: [
              //                     Colors.white.withValues(alpha: 0.1),
              //                     Colors.transparent,
              //                   ],
              //                   stops: const [0.0, 1.0],
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileProjectCard extends StatelessWidget {
  final Project project;
  const _MobileProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: Image.network(
              project.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Featured Project',
                  style: AppTheme.bodyText.copyWith(
                    color: AppTheme.primaryColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  project.title,
                  style: AppTheme.sectionTitle.copyWith(fontSize: 22),
                ),
                const SizedBox(height: 12),
                Text(project.description, style: AppTheme.bodyText),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: project.links.map((link) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          if (project.links.length > 1)
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                "${link.title}:",
                                style: AppTheme.bodyText.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          if (link.googlePlay != null)
                            _StoreButton(
                              icon: Icons.android,
                              url: link.googlePlay!,
                            ),
                          const SizedBox(width: 10),
                          if (link.appleStore != null)
                            _StoreButton(
                              icon: Icons.apple,
                              url: link.appleStore!,
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StoreButton extends StatelessWidget {
  final IconData icon;
  final String url;
  const _StoreButton({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
