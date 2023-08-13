import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:portfolio/auth/auth_error.dart';

@immutable
abstract class AppState {
  final bool isLoading;
  final AuthError? authError;

  const AppState({
    required this.isLoading,
    this.authError,
  });
}

@immutable
class AppStateLogin extends AppState {
  final User user;
  final Iterable<Reference> images;
  final String name;
  final Iterable<DocumentReference<Object?>> projectName;
  const AppStateLogin({
    required super.isLoading,
    required this.user,
    required this.name,
    required this.images,
    required this.projectName,
  });
}

@immutable
class AppStateLogOut extends AppState {
  const AppStateLogOut({required super.isLoading, super.authError});
  @override
  String toString() =>
      'AppStateLogOut isLoading = $isLoading, AuthError = $authError';
}

@immutable
class AppStateinSignUpView extends AppState {
  const AppStateinSignUpView({required super.isLoading, super.authError});
}

extension GetUser on AppState {
  User? get user {
    final cls = this;
    if (cls is AppStateLogin) {
      return cls.user;
    } else {
      return null;
    }
  }
}

extension GetImages on AppState {
  Iterable<Reference>? get images {
    final cls = this;
    if (cls is AppStateLogin) {
      return cls.images;
    } else {
      return null;
    }
  }
}

extension GetProjectName on AppState {
  Iterable<DocumentReference>? get getProjectName {
    final cls = this;
    if (cls is AppStateLogin) {
      return cls.projectName;
    } else {
      return null;
    }
  }
}

extension GetName on AppState {
  String? get getName {
    final cls = this;
    if (cls is AppStateLogin) {
      return cls.name;
    } else {
      return null;
    }
  }
}
