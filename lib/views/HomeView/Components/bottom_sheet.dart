import 'package:flutter/material.dart';

bottomSheet({required Widget child, required BuildContext context}) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    isDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: child,
      );
    },
  );
}
