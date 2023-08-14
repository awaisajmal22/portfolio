import 'dart:math';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/bloc/ThemeBloc/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/AppBloc/app_bloc.dart';
import '../../bloc/AppBloc/app_event.dart';
import '../../util/AppBar/appBar.dart';
import '../../util/Buttons/elevatedButton.dart';
import '../../util/TextFeild/textFeild.dart';
import '../../util/Theme/app_gradient.dart';

class SignUpView extends HookWidget {
  const SignUpView({super.key});
//0.0 = 0 degrees
// 0.5 = 180 degrees
// 1 = 360 degrees

  @override
  Widget build(BuildContext context) {
    final countryCode = useState<String>('+92');
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final _appBarcontroller = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final _animation = useAnimation(
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _appBarcontroller, curve: Curves.easeInOut),
      ),
    );
    _appBarcontroller.forward();
    final _titlecontroller = useAnimationController(
      duration: const Duration(seconds: 4),
    );
    Animation<double> _titleAnimation = Tween<double>(begin: 10, end: 0.0)
        .animate(CurvedAnimation(
            parent: _titlecontroller, curve: Curves.easeInOutExpo));

    _titlecontroller.forward();

    final _logincontroller = useAnimationController(
      duration: const Duration(seconds: 5),
    );
    Animation<double> _loginAnimation = Tween<double>(begin: 20, end: 0.0)
        .animate(CurvedAnimation(
            parent: _logincontroller, curve: Curves.easeInOutExpo));
    _logincontroller.forward();
    final isDark = useState<bool>(false);
    useEffect(() {
      isDarkMode().then((value) {
        isDark.value = value;
        print(value);
      });

      return () {};
    }, []);

    return GradientBox(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Opacity(
                opacity: _animation,
                child: loginAppBar(title: "Signup", context: context)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.055,
                  ),
                  AnimatedBuilder(
                      animation: _titlecontroller,
                      builder: (context, child) {
                        return SlideTransition(
                          position: AlwaysStoppedAnimation(Offset(
                            _titleAnimation.value,
                            0.0,
                          )),
                          child: textField(
                            context: context,
                            controller: nameController,
                            hintText: 'Enter Your Name..',
                            textInputType: TextInputType.text,
                          ),
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                          animation: _titlecontroller,
                          builder: (context, child) {
                            return SlideTransition(
                              position: AlwaysStoppedAnimation(Offset(
                                -_titleAnimation.value,
                                0.0,
                              )),
                              child: CountryCodePicker(
                                initialSelection: countryCode.value,
                                textStyle: TextStyle(
                                    color: isDark.value
                                        ? Colors.white
                                        : Colors.black),
                                dialogTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                searchStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                barrierColor: Colors.black26,
                                boxDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black),
                                searchDecoration: const InputDecoration(
                                    focusColor: Colors.black,
                                    hoverColor: Colors.black,
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true),
                                backgroundColor: Colors.black,
                                onChanged: (value) {
                                  countryCode.value = value.toString();
                                },
                              ),
                            );
                          }),
                      Expanded(
                        child: AnimatedBuilder(
                            animation: _titlecontroller,
                            builder: (context, child) {
                              return SlideTransition(
                                position: AlwaysStoppedAnimation(Offset(
                                  _titleAnimation.value,
                                  0.0,
                                )),
                                child: textField(
                                  context: context,
                                  controller: phoneController,
                                  hintText: 'Enter Your Phone..',
                                  textInputType: TextInputType.phone,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AnimatedBuilder(
                      animation: _titlecontroller,
                      builder: (context, child) {
                        return SlideTransition(
                          position: AlwaysStoppedAnimation(
                              Offset(_titleAnimation.value, 0.0)),
                          child: textField(
                            context: context,
                            controller: emailController,
                            hintText: 'Enter Your Email..',
                            textInputType: TextInputType.emailAddress,
                          ),
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AnimatedBuilder(
                      animation: _titlecontroller,
                      builder: (context, child) {
                        return SlideTransition(
                          position: AlwaysStoppedAnimation(
                              Offset(-_titleAnimation.value, 0.0)),
                          child: textField(
                            context: context,
                            controller: passwordController,
                            hintText: 'Enter Your Password..',
                            textInputType: TextInputType.text,
                            isObsecure: true,
                            textInputAction: TextInputAction.done,
                          ),
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AnimatedBuilder(
                      animation: _logincontroller,
                      builder: (context, _) {
                        return SlideTransition(
                          position: AlwaysStoppedAnimation(
                              Offset(0.0, _loginAnimation.value)),
                          child: elevatedButton(
                              context: context,
                              title: 'Signup',
                              onTap: () {
                                print('Dark ${isDark.value}');
                                final email = emailController.text;
                                final password = passwordController.text;
                                final name = nameController.text;
                                final phonenumber =
                                    "${countryCode.value} ${phoneController.text}";
                                print(email);
                                context.read<AppBloc>().add(AppEventRegister(
                                      email: email,
                                      password: password,
                                      name: name,
                                      phoneNumber: phonenumber,
                                    ));
                              }),
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  AnimatedBuilder(
                      animation: _logincontroller,
                      builder: (context, _) {
                        return SlideTransition(
                            position: AlwaysStoppedAnimation(
                                Offset(0.0, _loginAnimation.value)),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                    text: "Already have account? ",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context
                                                .read<AppBloc>()
                                                .add(const AppEventGoToLogin());
                                          },
                                        text: 'Login',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ]),
                              ),
                            ));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> isDarkMode() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("is_dark") ?? false;
}
