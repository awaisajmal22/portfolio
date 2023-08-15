import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';


@immutable
abstract class ThemeEvent {
  const ThemeEvent();
}

@immutable
class InitilizeThemeEvent implements ThemeEvent {
  const InitilizeThemeEvent();
}

@immutable
class ChangeThemeEvent implements ThemeEvent {
  
  const ChangeThemeEvent();

  // Iterable<Object?> get theme => [appTheme];
}



 