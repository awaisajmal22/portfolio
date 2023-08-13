import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget loginAppBar({required String title, required BuildContext context}) {
  return SizedBox(
    width: double.infinity,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.titleLarge)),
      ),
    ),
  );
}
