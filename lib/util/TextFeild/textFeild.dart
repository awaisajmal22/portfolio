import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Widget textField(
    {required TextEditingController controller,
    bool isObsecure = false,
    required String hintText,
    required BuildContext context,
    required TextInputType textInputType,
    TextInputAction textInputAction = TextInputAction.next}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(0, 2)),
          BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 2))
        ],
        color: Theme.of(context).indicatorColor,
        borderRadius: BorderRadius.circular(20)),
    child: TextFormField(
      style: Theme.of(context).textTheme.titleMedium,
      controller: controller,
      cursorColor: Theme.of(context).canvasColor,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      obscureText: isObsecure,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    ),
  );
}
