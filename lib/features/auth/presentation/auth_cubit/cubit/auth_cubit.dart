import 'package:bloc/bloc.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  late String? fristName;
  late String? lastName;
  late String? emailAddress;
  late String? password;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  bool? termsAndConditionsCheckBoxValue = false;
  bool? obsecure = true;
  signUpWithEmailAndPassword() async {
    try {
      emit(signupLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      verifyEmail();
      emit(signupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(signupFailureState(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(signupFailureState(
            error: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(signupFailureState(error: 'The email is invalid'));
      } else {
        emit(signupFailureState(error: e.code));
      }
    } catch (e) {
      emit(signupFailureState(error: e.toString()));
    }
  }

  verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  updateTermsAndConditionsCheckBox({required newValue}) {
    termsAndConditionsCheckBoxValue = newValue;
    emit(TermsAndConditionsUpdateState());
  }

  obsecureTextUpdate() {
    obsecure = !obsecure!;
    emit(obsecureTextState());
  }

  signInWithEmailAndPassword() async {
    try {
      emit(signinLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(signinSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(signinFailureState(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(signinFailureState(
            error: 'Wrong password provided for that user.'));
      } else {
        emit(signinFailureState(error: 'Check your email and password'));
      }
    } catch (e) {
      emit(signinFailureState(error: e.toString()));
    }
  }

  resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());

    } on Exception catch (e) {
      emit(ResetPasswordFailureState(error: e.toString()));
    }
  }
}
