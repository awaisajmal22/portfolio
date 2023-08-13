import 'package:flutter/material.dart' show BuildContext;

import 'generic_dailog.dart';

Future<bool> showLogoutDailog(
  BuildContext context,
) {
  return showGenericDailog(
    optionBuiler: () => {
      'Cancel': false,
      'Log out': true,
    },
    title: 'Log out',
     context: context,
     content: 'Are you sure you want to logout?'
  ).then(
    (value) => value ?? false,
  );
}
