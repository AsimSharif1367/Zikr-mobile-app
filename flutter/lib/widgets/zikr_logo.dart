import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ZikrLogo extends StatelessWidget {
  const ZikrLogo({super.key, this.size = 130});

  final double size;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ZikrLogoPainter(
          mainColor: isDark ? const Color(0xFF2B8A57) : AppColors.mainGreen,
          accentColor: AppColors.accentGold,
        ),
      ),
    );
  }
}

class _ZikrLogoPainter extends CustomPainter {
  _ZikrLogoPainter({required this.mainColor, required this.accentColor});

  final Color mainColor;
  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width * 0.39;

    final Rect canvasRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Paint haloPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          accentColor.withValues(alpha: 0.28),
          accentColor.withValues(alpha: 0.0),
        ],
      ).createShader(canvasRect);
    canvas.drawCircle(center, radius * 1.45, haloPaint);

    final Paint ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.05
      ..shader = SweepGradient(
        colors: [
          accentColor.withValues(alpha: 0.95),
          mainColor.withValues(alpha: 0.9),
          accentColor.withValues(alpha: 0.95),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius + 8));

    canvas.drawCircle(center, radius + 8, ringPaint);

    final Paint innerDisc = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withValues(alpha: 0.8),
          accentColor.withValues(alpha: 0.2),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, innerDisc);

    final Paint crescentPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          mainColor.withValues(alpha: 0.98),
          const Color(0xFF0B7A4A),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius * 0.62));

    final Paint cutoutPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withValues(alpha: 0.0)
      ..blendMode = BlendMode.clear;

    final Path crescent = Path()..addOval(
        Rect.fromCircle(
          center: Offset(center.dx - radius * 0.02, center.dy + radius * 0.02),
          radius: radius * 0.55,
        ),
      );

    final Path cutout = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(center.dx + radius * 0.23, center.dy - radius * 0.01),
          radius: radius * 0.47,
        ),
      );

    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());
    canvas.drawPath(crescent, crescentPaint);
    canvas.drawPath(cutout, cutoutPaint);
    canvas.restore();

    _drawStar(canvas, center, radius * 0.29, accentColor);

    final Paint glint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withValues(alpha: 0.28);
    canvas.drawCircle(
      Offset(center.dx - radius * 0.36, center.dy - radius * 0.36),
      radius * 0.12,
      glint,
    );
  }

  void _drawStar(Canvas canvas, Offset center, double radius, Color color) {
    final Path path = Path();
    const int points = 5;
    final double innerRadius = radius * 0.45;

    for (int i = 0; i < points * 2; i++) {
      final bool isOuter = i.isEven;
      final double currentRadius = isOuter ? radius : innerRadius;
      final double angle = (math.pi / points) * i - math.pi / 2;
      final double x = center.dx + currentRadius * math.cos(angle);
      final double y = center.dy + currentRadius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();

    final Paint starPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          color,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawPath(path.shift(Offset(radius * 0.54, -radius * 0.12)), starPaint);

    final Paint starOutline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.09
      ..color = const Color(0xFFF4C540).withValues(alpha: 0.7);
    canvas.drawPath(path.shift(Offset(radius * 0.54, -radius * 0.12)), starOutline);
  }

  @override
  bool shouldRepaint(covariant _ZikrLogoPainter oldDelegate) {
    return oldDelegate.mainColor != mainColor || oldDelegate.accentColor != accentColor;
  }
}
