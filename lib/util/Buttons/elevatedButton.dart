import 'package:flutter/material.dart';

ElevatedButton elevatedButton({
  required String title,
  required Function onTap,
  required BuildContext context,
}) {
  return ElevatedButton(
      
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      ));
}
