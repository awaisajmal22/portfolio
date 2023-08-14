import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final Color color;
  RPSCustomPainter({
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.009914000, size.height * 1.000082);
    path_0.cubicTo(
        size.width * -0.559530700,
        size.height * 1.300004,
        size.width * -0.11772200,
        size.height * -0.082234000,
        size.width * -0.205620000,
        size.height * -0.02266000);
    path_0.cubicTo(
        size.width * 0.04879000,
        size.height * -0.05969800,
        size.width * -0.00420000,
        size.height * 0.2670240,
        size.width * 0.3306420,
        size.height * 0.01232200);
    path_0.cubicTo(
        size.width * 0.3302860,
        size.height * 0.01187600,
        size.width * 0.2969360,
        size.height * 0.03912000,
        size.width * 0.3303560,
        size.height * 0.01124400);
    path_0.cubicTo(
        size.width * 0.3605760,
        size.height * -0.01396400,
        size.width * 0.3893640,
        size.height * 0.03559000,
        size.width * 0.4262300,
        size.height * 0.1218540);
    path_0.cubicTo(
        size.width * 0.5255900,
        size.height * 0.3763140,
        size.width * 0.5786420,
        size.height * -0.06864600,
        size.width * 0.6990380,
        size.height * 0.01691600);
    path_0.cubicTo(
        size.width * 0.9114360,
        size.height * 0.1678600,
        size.width * 1.010792,
        size.height * 0.001244000,
        size.width * 1.009882,
        size.height * 0.005710000);
    path_0.lineTo(size.width * 1.006394, size.height * 1.003582);

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;
    paint_0_stroke.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPS2CustomPainter extends CustomPainter {
  final Color color;
  RPS2CustomPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.01187000, size.height * 0.03115600);
    path_0.moveTo(size.width * -0.03037800, size.height * 0.03515600);
    path_0.cubicTo(
        size.width * 0.1447120,
        size.height * 0.2678940,
        size.width * 0.1764900,
        size.height * -0.1189300,
        size.width * 0.3661360,
        size.height * 0.03812600);
    path_0.cubicTo(
        size.width * 0.5418460,
        size.height * 0.2044040,
        size.width * 0.6294720,
        size.height * 0.1129280,
        size.width * 0.6844800,
        size.height * 0.03367200);
    path_0.cubicTo(
        size.width * 0.7836200,
        size.height * -0.1091700,
        size.width * 0.7746280,
        size.height * 0.2595400,
        size.width * 1.005686,
        size.height * 0.02773800);
    path_0.cubicTo(
        size.width * 1.088624,
        size.height * -0.06893000,
        size.width * 1.103546,
        size.height * 1.052960,
        size.width * 1.103546,
        size.height * 1.052960);
    path_0.lineTo(size.width * -0.1551260, size.height * 1.041090);
    path_0.cubicTo(
        size.width * -0.1551260,
        size.height * 1.041090,
        size.width * -0.1589380,
        size.height * -0.1357340,
        size.width * -0.03037800,
        size.height * 0.03515600);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AuthPainter extends CustomPainter {
  final Color color;
  AuthPainter({
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.001482000, size.height * 0.1557860);
    path_0.lineTo(size.width, size.height * 0.1631700);
    path_0.lineTo(size.width * 1, size.height * 0.628260);
    path_0.cubicTo(
        size.width * 0.5168220,
        size.height * 0.8345620,
        size.width * 0.4540680,
        size.height * 2.1425680,
        size.width * -0.0001500000,
        size.height * 0.2797280);
    path_0.lineTo(size.width * -0.001482000, size.height * 0.1557860);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
