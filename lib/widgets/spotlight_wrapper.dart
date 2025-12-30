import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SpotlightWrapper extends StatefulWidget {
  final Widget child;
  const SpotlightWrapper({super.key, required this.child});

  @override
  State<SpotlightWrapper> createState() => _SpotlightWrapperState();
}

class _SpotlightWrapperState extends State<SpotlightWrapper> {
  Offset _mousePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _mousePosition = event.position;
        });
      },
      child: Stack(
        children: [
          // The App Content
          widget.child,

          // The Spotlight Overlay
          Positioned.fill(
            child: IgnorePointer(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Avoid division by zero
                  if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
                    return const SizedBox();
                  }

                  // Calculate relative alignment (-1.0 to 1.0)
                  final dx = (_mousePosition.dx / constraints.maxWidth) * 2 - 1;
                  final dy =
                      (_mousePosition.dy / constraints.maxHeight) * 2 - 1;

                  return Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment(dx, dy),
                        radius: 0.5, // Larger radius for global effect
                        colors: [
                          AppTheme.primaryPurple.withValues(alpha: 0.08),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
