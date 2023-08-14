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
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.06,
            left: MediaQuery.of(context).size.width * 0.27),
        child: Text(title, style: Theme.of(context).textTheme.titleLarge),
      ),
    ),
  );
}
