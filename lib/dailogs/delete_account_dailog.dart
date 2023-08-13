import 'package:flutter/material.dart' show BuildContext;

import 'generic_dailog.dart';

Future<bool> showDeleteAccountDalog(
  BuildContext context,
) {
  return showGenericDailog<bool>(
    context: context,
    optionBuiler: () => {
      'Cancel': false,
      'Delete Account': true,
    },
    title: 'Delete Account',
    content:
        'Are you sure you want to delete your account? if you cAannot undo this!',
  ).then(
    (value) => value ?? false,
  );
}
