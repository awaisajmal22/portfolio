import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter/foundation.dart' show immutable;

const Map<String, AuthError> authErrorMapping = {
  'user-not-found': AuthErrorUserNotFound(),
  'weak-password': AuthErrorWeakPassword(),
  'invalid-email': AuthErrorInvalidEmail(),
  'operation-not-allowed': AuthErrorOpertionNotAllowed(),
  'email-already-in-use': AuthErrorEmailAlreadyInUse(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'no-current-user': AuthErrorNoCurrentUser()
};

@immutable
abstract class AuthError {
  final String dailogTitle;
  final String dailogError;
  const AuthError({
    required this.dailogTitle,
    required this.dailogError,
  });

  factory AuthError.from(FirebaseAuthException expection) =>
      authErrorMapping[expection.code.toLowerCase().trim()] ??
      const AuthErrorUnknown();
}

@immutable
class AuthErrorUnknown extends AuthError {
  const AuthErrorUnknown()
      : super(
          dailogTitle: 'Authentication Error',
          dailogError: 'Unknown Authentication Error....',
        );
}

@immutable
class AuthErrorNoCurrentUser extends AuthError {
  const AuthErrorNoCurrentUser()
      : super(
          dailogTitle: 'No current user!',
          dailogError: 'No current user with this information was found.',
        );
}

@immutable
class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin()
      : super(
          dailogTitle: 'Requires recent login.',
          dailogError:
              'You need to logout and login back in order to perform this operation.',
        );
}

@immutable
class AuthErrorOpertionNotAllowed extends AuthError {
  const AuthErrorOpertionNotAllowed()
      : super(
          dailogTitle: 'Operation not Allowed',
          dailogError:
              'You cannot register using this method at this moment time!',
        );
}

@immutable
class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound()
      : super(
            dailogTitle: 'User not found.',
            dailogError: 'The given user was not found on the server!');
}

@immutable
class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword()
      : super(
          dailogTitle: 'Weak password',
          dailogError:
              'Please choose a stronger password consisting on more characters!',
        );
}

@immutable
class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
          dailogTitle: 'Invalid email.',
          dailogError: 'Please check your email and try again.',
        );
}

@immutable
class AuthErrorEmailAlreadyInUse extends AuthError {
  const AuthErrorEmailAlreadyInUse()
      : super(
          dailogTitle: 'Email already in use',
          dailogError: 'Please choose another email to register with!',
        );
}

