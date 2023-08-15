import 'package:flutter/material.dart';

Widget loginAppBar({required String title, required BuildContext context}) {
  return Stack(
    children: [
      ClipPath(
        clipper: ClipperView(),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor.withAlpha(150),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.16,
        ),
      ),
      ClipPath(
        clipper: ClipperView(),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
          color: Theme.of(context).canvasColor,
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
                left: MediaQuery.of(context).size.width * 0.1),
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
      ),
    ],
  );
}

class ClipperView extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final h = size.height;
    final w = size.width;
    Path _path = Path();
    // _path.moveTo(0, h);
    _path.lineTo(0, h);
    _path.quadraticBezierTo(w * 0.504000, h * 0.6, w * 0.3, h * 0.2);
    _path.quadraticBezierTo(w * 0.404000, h * 0.2, w * 0.5, h);
    _path.quadraticBezierTo(w * 0.83, h * 0.02, w, h * 0.5);
    _path.lineTo(w, 0);
    _path.close();
    // TODO: implement getClip
    return _path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
// class AuthPainter extends CustomPainter {
//   final Color color;
//   AuthPainter({
//     required this.color,
//   });
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path_0 = Path();
//     path_0.moveTo(size.width * 0.001482000, size.height * 0.1557860);
//     path_0.lineTo(size.width, size.height * 0.1631700);
//     path_0.lineTo(size.width * 1, size.height * 0.628260);
//     path_0.cubicTo(
//         size.width * 0.5168220,
//         size.height * 0,
//         size.width * 0.4540680,
//         size.height * 3.1425680,
//         size.width * -0.0001500000,
//         size.height * 0.1797280);
//     path_0.lineTo(size.width * -0.001482000, size.height * 0.1557860);
//     path_0.close();

//     Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
//     paint_0_fill.color = color;
//     canvas.drawPath(path_0, paint_0_fill);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }