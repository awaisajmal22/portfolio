import 'package:flutter/material.dart';

Widget elevatedButton({
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

Widget customElevatedButton({
  required String title,
  required Function onTap,
  required BuildContext context,
}) {
  return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            elevation: MaterialStateProperty.all(20),
            shadowColor: MaterialStateProperty.all(
              Theme.of(context).canvasColor,
            ),
            
            foregroundColor: MaterialStateProperty.all(
              Theme.of(context).canvasColor,
            ),
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).indicatorColor,
            ),
          ),
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 18,
            ),
      ));
}
