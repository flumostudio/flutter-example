import 'package:flumo_flutter_example/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MapMarkerPin extends StatelessWidget {
  const MapMarkerPin({
    required this.child,
    this.color = AppColors.seed,
    this.size = 48.0,
    super.key,
  });

  final Widget child;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 1.3,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(
            size: Size(size, size * 1.3),
            painter: _PinPainter(color: color),
          ),
          Positioned(
            top: size * 0.15,
            child: Container(
              width: size * 0.7,
              height: size * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class _PinPainter extends CustomPainter {
  _PinPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;
    final r = w / 2;

    final path = Path()
      ..moveTo(w / 2, h)
      ..quadraticBezierTo(
        w,
        h * 0.65, // Control point
        w,
        r, // End point (right side of circle)
      )
      ..arcToPoint(
        Offset(0, r),
        radius: Radius.circular(r),
        clockwise: false,
      )
      ..quadraticBezierTo(
        0,
        h * 0.65, // Control point
        w / 2,
        h, // End point
      )
      ..close();

    // Draw shadow and shape
    canvas
      ..drawShadow(path, Colors.black.withValues(alpha: 0.3), 4, false)
      ..drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
