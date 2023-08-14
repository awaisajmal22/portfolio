import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/bloc/AppBloc/app_state.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/AppBloc/app_bloc.dart';
import '../../bloc/AppBloc/app_event.dart';
import '../../bloc/ThemeBloc/theme_bloc.dart';
import '../../bloc/ThemeBloc/theme_event.dart';
import '../../bloc/ThemeBloc/theme_state.dart';
import '../../dailogs/logout_dailog.dart';
import '../../util/Theme/app_gradient.dart';
import '../../util/Theme/app_theme.dart';
import 'Components/add_new_project_widget.dart';
import 'Components/add_project_images_and_detail.dart';
import 'Components/bottom_sheet.dart';

class HomeView extends HookWidget {
  final innerNavigatorKey = GlobalKey<ScaffoldState>();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    StateMachineController? stateMachineController;
    SMIInput<bool>? switchInput;
    final name = context.watch<AppBloc>().state.getName ?? [];
    final isDark = useState<bool>(false);
    // useEffect(() {
    //   isDarkMode().then((value) {
    //     isDark.value = value;
    //   });

    //   return () {};
    // }, []);
    return Scaffold(
      key: innerNavigatorKey,
      drawer: drawer(context, name,
          color: isDark.value ? Colors.white : Colors.black),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      innerNavigatorKey.currentState?.openDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: isDark.value ? Colors.black : Colors.white,
                        ),
                        shape: BoxShape.circle,
                        color: isDark.value ? Colors.white : Colors.black,
                      ),
                      child: Icon(
                        Ionicons.menu_outline,
                        color: isDark.value ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          // if (switchInput == null) return;

                          // isDark.value = switchInput?.value ?? false;
                          context
                              .read<ThemeBloc>()
                              .add(const ChangeThemeEvent());
                          // switchInput?.change(!isDark.value);
                          // isDark.value = !isDark.value;
                          print(isDark.value);
                          switchInput?.change(!isDark.value);
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: RiveAnimation.asset(
                            'assets/switch_theme.riv',
                            fit: BoxFit.cover,
                            stateMachines: const ['Switch Theme'],
                            onInit: (artboard) {
                              stateMachineController =
                                  StateMachineController.fromArtboard(
                                      artboard, 'Switch Theme');

                              if (stateMachineController == null) return;
                              artboard.addController(stateMachineController!);
                              switchInput =
                                  stateMachineController?.findInput("isDark");
                              final mode =
                                  context.read<ThemeBloc>().state.themeType;

                              isDark.value =
                                  mode == appTheme[ThemeType.darkTheme];
                              switchInput?.change(isDark.value);
                            },
                          ),
                        ),
                      );
                      // CupertinoSwitch(
                      //     activeColor: Colors.white,
                      //     thumbColor:
                      //         state.themeType == appTheme[ThemeType.lightTheme]
                      //             ? Colors.white
                      //             : Colors.black,
                      //     value:
                      //         state.themeType == appTheme[ThemeType.darkTheme],
                      //     onChanged: (bool val) {
                      //       BlocProvider.of<ThemeBloc>(context)
                      //           .add(const ChangeThemeEvent());
                      //     });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawer(BuildContext context, Object name, {required Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.2,
      ),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 40,
                offset: Offset(-10, 0),
              )
            ]),
        child: Drawer(
          elevation: 0,
          width: MediaQuery.of(context).size.width * 0.2,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const CircleAvatar(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  name.toString().toUpperCase(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                drawerButton(
                  onTap: () {
                    innerNavigatorKey.currentState?.closeDrawer();
                    bottomSheet(
                        context: context,
                        child: AddNewProject(
                          color: color,
                        ));
                  },
                  icon: Ionicons.create_outline,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                drawerButton(
                  onTap: () {
                    innerNavigatorKey.currentState?.closeDrawer();
                    bottomSheet(
                        context: context,
                        child: AddProjcetImagesAndDetail(
                          color: color,
                        ));
                  },
                  icon: Ionicons.albums_outline,
                ),
                const Spacer(),
                drawerButton(
                    icon: Ionicons.exit_outline,
                    onTap: () async {
                      final logout = await showLogoutDailog(context);
                      if (logout) {
                        context.read<AppBloc>().add(
                              const AppEventLogOut(),
                            );
                      }
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector drawerButton(
      {required Function onTap, required IconData icon}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Icon(icon),
    );
  }
}

// Future<bool> isDarkMode() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getBool("is_dark") ?? false;
// }
