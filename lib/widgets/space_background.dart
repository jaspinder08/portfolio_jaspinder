import 'dart:math';
import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';

class SpaceBackground extends StatefulWidget {
  final Widget child;
  const SpaceBackground({super.key, required this.child});

  @override
  State<SpaceBackground> createState() => _SpaceBackgroundState();
}

class _SpaceBackgroundState extends State<SpaceBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Star> _stars = [];
  final Random _rnd = Random();

  @override
  void initState() {
    super.initState();
    // Initialize stars
    for (int i = 0; i < 150; i++) {
      _stars.add(_Star(
        x: _rnd.nextDouble(),
        y: _rnd.nextDouble(),
        size: _rnd.nextDouble() * 2 + 0.5,
        opacity: _rnd.nextDouble() * 0.8 + 0.1,
        speed: _rnd.nextDouble() * 0.005 + 0.001,
      ));
    }

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base dark
        Container(color: AppColors.bgBase),

        // Radial glow
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.3),
                radius: 0.5,
                colors: [
                  AppColors.accentCyan.withOpacity(0.08),
                  AppColors.accent.withOpacity(0.05),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.4, 1.0],
              ),
            ),
          ),
        ),

        // Particles
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              for (var s in _stars) {
                s.y -= s.speed;
                if (s.y < 0) {
                  s.y = 1.0;
                  s.x = _rnd.nextDouble();
                }
              }
              return CustomPaint(
                painter: _StarPainter(_stars),
              );
            },
          ),
        ),

        // Content
        widget.child,
      ],
    );
  }
}

class _Star {
  double x;
  double y;
  double size;
  double opacity;
  double speed;

  _Star(
      {required this.x,
      required this.y,
      required this.size,
      required this.opacity,
      required this.speed});
}

class _StarPainter extends CustomPainter {
  final List<_Star> stars;

  _StarPainter(this.stars);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    for (var s in stars) {
      paint.color = Colors.white.withOpacity(s.opacity);
      canvas.drawCircle(
          Offset(s.x * size.width, s.y * size.height), s.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarPainter oldDelegate) => true;
}
