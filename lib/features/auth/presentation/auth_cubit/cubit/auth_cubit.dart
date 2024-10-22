import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  
 Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(signupLoadingState());
    
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
     await addUserProfile();
     await verifyEmail();
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

 Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

 void updateTermsAndConditionsCheckBox({required newValue}) {
    termsAndConditionsCheckBoxValue = newValue;
    emit(TermsAndConditionsUpdateState());
  }

 void obsecureTextUpdate() {
    obsecure = !obsecure!;
    emit(obsecureTextState());
  }

 Future<void> signInWithEmailAndPassword() async {
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

 Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());

    } on Exception catch (e) {
      emit(ResetPasswordFailureState(error: e.toString()));
    }
  }


Future<void> addUserProfile()async
{
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  await users.add
  ({
"email":emailAddress,
"frist_name":fristName,
"last_name":lastName,



});
}

}
