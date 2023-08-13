import 'package:flutter/material.dart' show BuildContext;

import '../auth/auth_error.dart';
import 'generic_dailog.dart';

Future<void> showAuthErrorDailog({
  required AuthError authError,
  required BuildContext contxt,
}) {
  return showGenericDailog<void>(
    context: contxt,
    optionBuiler: () => {
      'OK': false,
    },
    title: authError.dailogTitle,
    content: authError.dailogError,
  );
}
