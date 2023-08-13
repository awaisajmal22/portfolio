import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/util/Theme/app_gradient.dart';
import 'package:portfolio/util/loader/loading_screen.dart';
import 'package:portfolio/views/HomeView/home_view.dart';
import 'package:portfolio/views/AuthView/signup_view.dart';
import 'bloc/AppBloc/app_bloc.dart';
import 'bloc/AppBloc/app_state.dart';
import 'bloc/ThemeBloc/theme_bloc.dart';
import 'bloc/ThemeBloc/theme_event.dart';
import 'bloc/ThemeBloc/theme_state.dart';
import 'dailogs/show_auth_error_dailog.dart';
import 'firebase_options.dart';
import 'views/AuthView/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => AppBloc(),
    ),
    BlocProvider(
      create: (_) => ThemeBloc()..add(const InitilizeThemeEvent()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: state.themeType,
        home: BlocConsumer<AppBloc, AppState>(
          builder: (context, state) {
            if (state is AppStateLogOut) {
              return const GradientBox(child: LoginView());
            } else if (state is AppStateLogin) {
              return GradientBox(child: HomeView());
            } else if (state is AppStateinSignUpView) {
              return const GradientBox(child: SignUpView());
            } else {
              return Container();
            }
          },
          listener: (context, state) {
            if (state.isLoading) {
              return LoadingScreen.inatance()
                  .show(context: context, text: 'Loading....');
            } else {
              LoadingScreen.inatance().hide();
            }
            final error = state.authError;
            if (error != null) {
              showAuthErrorDailog(
                authError: error,
                contxt: context,
              );
            }
          },
        ),
      );
    });
  }
}
