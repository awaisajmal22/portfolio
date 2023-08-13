import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfolio/bloc/AppBloc/app_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/auth_error.dart';
import '../../models/user_model.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
          const AppStateLogOut(
            isLoading: false,
          ),
        ) {
    on<AppEventGotToRegister>(
      (event, emit) async {
        emit(
          const AppStateinSignUpView(
            isLoading: false,
          ),
        );
      },
    );
    on<AppEventRegister>(
      (event, emit) async {
        emit(
          const AppStateinSignUpView(
            isLoading: true,
          ),
        );
        final name = event.name;
        final password = event.password;
        final email = event.email;
        final phoneNumber = event.phoneNumber;
        try {
          print(phoneNumber);
          final credentials = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          await FirebaseFirestore.instance
              .collection(credentials.user!.uid)
              .doc(credentials.user!.uid)
              .set({
            'name': name,
            'email': email,
            'password': password,
            'phone': phoneNumber,
          });
          emit(
            AppStateLogin(
              isLoading: false,
              user: credentials.user!,
              name: '',
              images: const [],
              projectName: const [],
            ),
          );
        } on FirebaseAuthException catch (e) {
          emit(
            AppStateinSignUpView(
              isLoading: false,
              authError: AuthError.from(e),
            ),
          );
        }
      },
    );
    on<AppEventGoToLogin>(
      (event, emit) async {
        emit(
          const AppStateLogOut(isLoading: false),
        );
      },
    );

    on<AppEventLogOut>(
      (event, emit) async {
        emit(
          const AppStateLogOut(
            isLoading: true,
          ),
        );
        await FirebaseAuth.instance.signOut();
        emit(
          const AppStateLogOut(
            isLoading: false,
          ),
        );
      },
    );

    on<AppEventLogin>(
      (event, emit) async {
        emit(
          const AppStateLogOut(
            isLoading: true,
          ),
        );
        try {
          final email = event.email;
          final password = event.password;
          final userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          final user = userCredential.user!;
          final data = await _getData(uid: user.uid);
          emit(
            AppStateLogin(
                user: user,
                images: const [],
                isLoading: false,
                name: data,
                projectName: const []),
          );
        } on FirebaseAuthException catch (e) {
          emit(
            AppStateLogOut(
              isLoading: false,
              authError: AuthError.from(e),
            ),
          );
        }
      },
    );
  }
}

Future _getData({
  required String uid,
}) {
  return FirebaseFirestore.instance
      .collection(uid)
      .doc(uid)
      .get()
      .then((value) => value['name']);
}
