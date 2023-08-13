import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/ThemeBloc/theme_event.dart';
import 'package:portfolio/bloc/ThemeBloc/theme_state.dart';
import 'package:portfolio/util/Theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(LightThemeState(themeType: appTheme[ThemeType.lightTheme]!, gradientType: appGradient[ThemeType.lightTheme]!)) {
    on<InitilizeThemeEvent>(
      (event, emit) async {
        final hasDark = await isDark();
        print(hasDark);
        if (hasDark) {
          emit(
            DarkThemeState(
              themeType: appTheme[ThemeType.darkTheme]!, gradientType: appGradient[ThemeType.darkTheme]!,
            ),
          );
        } else {
          emit(
            LightThemeState(
                themeType: appTheme[ThemeType.lightTheme]!,
                gradientType: appGradient[ThemeType.lightTheme]!),
          );
        }
      },
    );

    on<ChangeThemeEvent>(
      (event, emit) async {
        // final isDark = state.themeType == appTheme[ThemeType.darkTheme];
        final isDark = state.themeType == appTheme[ThemeType.darkTheme];
        // print(isDark);

        emit(
          isDark
              ? LightThemeState(
                  themeType: appTheme[ThemeType.lightTheme]!,
                  gradientType: appGradient[ThemeType.lightTheme]!,
                )
              : DarkThemeState(
                  themeType: appTheme[ThemeType.darkTheme]!,
                  gradientType: appGradient[ThemeType.darkTheme]!,
                ),
        );

        setTheme(isDark);
      },
    );
  }
}

Future<bool> isDark() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("is_dark") ?? false;
}

Future<void> setTheme(bool isDark) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("is_dark", !isDark);
}
