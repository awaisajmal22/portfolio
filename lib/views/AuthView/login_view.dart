import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/AppBloc/app_bloc.dart';
import '../../bloc/AppBloc/app_event.dart';
import '../../util/AppBar/appBar.dart';
import '../../util/Buttons/elevatedButton.dart';
import '../../util/TextFeild/textFeild.dart';
import '../../util/Theme/app_gradient.dart';

class LoginView extends HookWidget {
  const LoginView({super.key});
//0.0 = 0 degrees
// 0.5 = 180 degrees
// 1 = 360 degrees

  @override
  Widget build(BuildContext context) {
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
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

    final _signupcontroller = useAnimationController(
      duration: const Duration(seconds: 5),
    );
    Animation<double> _signupAnimation = Tween<double>(begin: 20, end: 0.0)
        .animate(CurvedAnimation(
            parent: _signupcontroller, curve: Curves.easeInOutExpo));

    _signupcontroller.forward();
    return GradientBox(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Opacity(
                opacity: _animation,
                child: loginAppBar(title: "Login", context: context)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.055,
                  ),
                  AnimatedBuilder(
                      animation: _titlecontroller,
                      builder: (context, child) {
                        return SlideTransition(
                          position: AlwaysStoppedAnimation(
                              Offset(0.0, -_titleAnimation.value)),
                          // alignment: Alignment.center,
                          // transform: Matrix4.rotationX(
                          //     2 * pi * _titlecontroller.value),
                          child: Center(
                            child: Text(
                              "Portfolio",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  AnimatedBuilder(
                      animation: _titlecontroller,
                      builder: (context, child) {
                        return SlideTransition(
                          position: AlwaysStoppedAnimation(
                              Offset(_titleAnimation.value, 0.0)),
                          child: textField(
                            context: context,
                            controller: _emailController,
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
                            controller: _passwordController,
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
                  AnimatedBuilder(
                      animation: _titlecontroller,
                      builder: (context, _) {
                        return SlideTransition(
                          position: AlwaysStoppedAnimation(
                              Offset(_titleAnimation.value, 0.0)),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              )),
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AnimatedBuilder(
                      animation: _signupcontroller,
                      builder: (context, _) {
                        return SlideTransition(
                          position: AlwaysStoppedAnimation(
                              Offset(0.0, _signupAnimation.value)),
                          child: elevatedButton(
                              context: context,
                              title: 'Login',
                              onTap: () {
                                context.read<AppBloc>().add(
                                      AppEventLogin(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    );
                              }),
                        );
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  AnimatedBuilder(
                      animation: _signupcontroller,
                      builder: (context, _) {
                        return SlideTransition(
                            position: AlwaysStoppedAnimation(
                                Offset(0.0, _signupAnimation.value)),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                    text: "You don't have an account? ",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.read<AppBloc>().add(
                                                const AppEventGotToRegister());
                                          },
                                        text: 'Signup',
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
