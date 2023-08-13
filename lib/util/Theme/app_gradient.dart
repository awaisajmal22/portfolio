import 'package:flutter/material.dart';
import '../../bloc/ThemeBloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/ThemeBloc/theme_bloc.dart';

class GradientBox extends StatelessWidget {
  final Widget child;
  const GradientBox({required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          gradient: state.gradientType,
        ),
        child: child,
      );
    });
  }
}
