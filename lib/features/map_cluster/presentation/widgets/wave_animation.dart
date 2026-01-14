import 'dart:math' as math show pi, sin, sqrt;

import 'package:flutter/material.dart';

/// Animated ripple/wave effect used for cluster markers.
class WaveAnimation extends StatefulWidget {
  const WaveAnimation({
    required this.centerChild,
    this.size = 80,
    this.color = Colors.red,
    super.key,
  });

  final double size;
  final Color color;
  final Widget centerChild;

  @override
  State<WaveAnimation> createState() => WaveAnimationState();
}

class WaveAnimationState extends State<WaveAnimation> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  Widget _animatedChild() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size),
          gradient: RadialGradient(
            colors: [
              widget.color.withValues(alpha: 0.9),
              Color.lerp(widget.color, Colors.white, 0.35)!,
            ],
          ),
        ),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1).animate(
            CurvedAnimation(
              parent: _controller,
              curve: CurveWave(),
            ),
          ),
          child: Container(
            width: widget.size * 0.65,
            height: widget.size * 0.65,
            margin: const EdgeInsets.all(6),
            child: widget.centerChild,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(_controller, color: widget.color),
      child: SizedBox(
        width: widget.size * 1.6,
        height: widget.size * 1.6,
        child: _animatedChild(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(this.animation, {required this.color}) : super(repaint: animation);

  final Color color;
  final Animation<double> animation;

  void _circle(Canvas canvas, Rect rect, double value) {
    final opacity = ((1 - (value / 4)) * 0.35).clamp(0.0, 1.0);
    final rippleColor = color.withValues(alpha: opacity);
    final size = rect.width / 2;
    final area = size * size;
    final radius = math.sqrt(area * value / 4);
    final paint = Paint()..color = rippleColor;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    for (var wave = 3; wave >= 0; wave--) {
      _circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}

class CurveWave extends Curve {
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}
