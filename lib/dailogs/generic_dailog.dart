import 'package:flutter/material.dart';

typedef DailogOptionBuiler<T> = Map<String, T?> Function();
Future<T?> showGenericDailog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DailogOptionBuiler optionBuiler,
}) {
  final options = optionBuiler();
  return showDialog<T?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        content: Text(
          content,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: options.keys.map((optionTitle) {
          final value = options[optionTitle];
          return TextButton(
            onPressed: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(optionTitle,
                style: Theme.of(context).textTheme.displayMedium),
          );
        }).toList(),
      );
    },
  );
}
