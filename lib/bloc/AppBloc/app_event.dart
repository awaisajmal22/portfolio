import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AppEvent {
  const AppEvent();
}

@immutable
class AppEventLogin implements AppEvent {
  final String email;
  final String password;
  const AppEventLogin({
    required this.email,
    required this.password,
  });
}

@immutable
class AppEventSignUp implements AppEvent {
  final String email;
  final String password;
  final String name;
  final String phoneNumber;
  const AppEventSignUp({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}

@immutable
class AppEventLogOut implements AppEvent {
  const AppEventLogOut();
}

@immutable
class AppEventRegister implements AppEvent {
  final String email;
  final String password;
  final String name;
  final String phoneNumber;
  const AppEventRegister({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
  });
}

@immutable
class AppEventGoToLogin implements AppEvent {
  const AppEventGoToLogin();
}

@immutable
class AppEventGotToRegister implements AppEvent {
  const AppEventGotToRegister();
}
