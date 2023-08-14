import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Painter/painter.dart';

Widget loginAppBar({required String title, required BuildContext context}) {
  return SizedBox(
    width: double.infinity,
    child: CustomPaint(
      painter: AuthPainter(color: Theme.of(context).canvasColor),
      size: Size(double.infinity, MediaQuery.of(context).size.height * 1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.titleLarge)),
      ),
    ),
  );
}
