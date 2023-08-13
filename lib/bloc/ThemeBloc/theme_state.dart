import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';

import '../../util/Theme/app_theme.dart';

@immutable
abstract class ThemeState {
  final ThemeData themeType;
  final LinearGradient gradientType;
  const ThemeState({
    required this.gradientType,
    required this.themeType,
  });
}

@immutable
class LightThemeState extends ThemeState {
  const LightThemeState({required super.themeType, required super.gradientType});
}

@immutable
class DarkThemeState extends ThemeState {
  const DarkThemeState({required super.themeType, required super.gradientType});
}
