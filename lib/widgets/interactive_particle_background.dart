import 'dart:math';

import 'package:flutter/material.dart';

class InteractiveParticleBackground extends StatefulWidget {
  final int numberOfParticles;
  final Color particleColor;
  final double connectionDistance;
  final ValueNotifier<Offset?>? mousePosition;

  const InteractiveParticleBackground({
    super.key,
    this.numberOfParticles = 80,
    this.particleColor = const Color.fromARGB(255, 11, 9, 13),
    this.connectionDistance = 150,
    this.mousePosition,
  });

  @override
  State<InteractiveParticleBackground> createState() =>
      _InteractiveParticleBackgroundState();
}

class _InteractiveParticleBackgroundState
    extends State<InteractiveParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  Offset? _mousePosition;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    widget.mousePosition?.addListener(_onExternalMouseUpdate);
  }

  void _onExternalMouseUpdate() {
    setState(() {
      _mousePosition = widget.mousePosition?.value;
    });
  }

  void _initializeParticles(Size size) {
    if (_particles.isNotEmpty) return;
    for (int i = 0; i < widget.numberOfParticles; i++) {
      _particles.add(
        Particle(
          x: _random.nextDouble() * size.width,
          y: _random.nextDouble() * size.height,
          vx: (_random.nextDouble() - 0.5) * 1.5,
          vy: (_random.nextDouble() - 0.5) * 1.5,
          size: _random.nextDouble() * 2 + 1,
        ),
      );
    }
  }

  @override
  void dispose() {
    widget.mousePosition?.removeListener(_onExternalMouseUpdate);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          onHover: (event) {
            setState(() {
              _mousePosition = event.localPosition;
            });
          },
          onExit: (event) {
            setState(() {
              _mousePosition = null;
            });
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              _initializeParticles(
                Size(constraints.maxWidth, constraints.maxHeight),
              );
              _updateParticles(
                Size(constraints.maxWidth, constraints.maxHeight),
              );
              return CustomPaint(
                painter: _ParticlePainter(
                  particles: _particles,
                  particleColor: widget.particleColor,
                  connectionDistance: widget.connectionDistance,
                  mousePosition: _mousePosition,
                ),
                size: Size(constraints.maxWidth, constraints.maxHeight),
              );
            },
          ),
        );
      },
    );
  }

  void _updateParticles(Size size) {
    for (var particle in _particles) {
      // Basic movement
      particle.x += particle.vx;
      particle.y += particle.vy;

      // Mouse repulsion
      if (_mousePosition != null) {
        double dx = particle.x - _mousePosition!.dx;
        double dy = particle.y - _mousePosition!.dy;
        double distance = sqrt(dx * dx + dy * dy);
        double repulsionRadius = 150.0;

        if (distance < repulsionRadius) {
          double force = (repulsionRadius - distance) / repulsionRadius;
          double angle = atan2(dy, dx);
          particle.x += cos(angle) * force * 2;
          particle.y += sin(angle) * force * 2;
        }
      }

      // Bounce off edges
      if (particle.x < 0 || particle.x > size.width) {
        particle.vx *= -1;
      }
      if (particle.y < 0 || particle.y > size.height) {
        particle.vy *= -1;
      }

      // Keep within bounds roughly (wrap or clamp)
      if (particle.x < -20) particle.x = size.width + 20;
      if (particle.x > size.width + 20) particle.x = -20;
      if (particle.y < -20) particle.y = size.height + 20;
      if (particle.y > size.height + 20) particle.y = -20;
    }
  }
}

class Particle {
  double x;
  double y;
  double vx;
  double vy;
  double size;

  Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.size,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final Color particleColor;
  final double connectionDistance;
  final Offset? mousePosition;

  _ParticlePainter({
    required this.particles,
    required this.particleColor,
    required this.connectionDistance,
    this.mousePosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = particleColor.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    final Paint linePaint = Paint()
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < particles.length; i++) {
      Particle p1 = particles[i];

      // Draw particle
      canvas.drawCircle(Offset(p1.x, p1.y), p1.size, paint);

      // Connect to other particles
      for (int j = i + 1; j < particles.length; j++) {
        Particle p2 = particles[j];
        double dx = p1.x - p2.x;
        double dy = p1.y - p2.y;
        double distance = sqrt(dx * dx + dy * dy);

        if (distance < connectionDistance) {
          double opacity = (1.0 - (distance / connectionDistance)).clamp(
            0.0,
            1.0,
          );
          linePaint.color = particleColor.withValues(alpha: 0.3 * opacity);
          canvas.drawLine(Offset(p1.x, p1.y), Offset(p2.x, p2.y), linePaint);
        }
      }

      // Optional: Connect to mouse
      if (mousePosition != null) {
        double dx = p1.x - mousePosition!.dx;
        double dy = p1.y - mousePosition!.dy;
        double distance = sqrt(dx * dx + dy * dy);

        if (distance < connectionDistance) {
          double opacity = (1.0 - (distance / connectionDistance)).clamp(
            0.0,
            1.0,
          );
          linePaint.color = particleColor.withValues(alpha: 0.4 * opacity);
          canvas.drawLine(Offset(p1.x, p1.y), mousePosition!, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) {
    return true; // Simple approach for continuous animation
  }
}
