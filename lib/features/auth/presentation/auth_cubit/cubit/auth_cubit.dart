
import 'package:bloc/bloc.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
late String?  fristName;
late String?  lastName;
late String?  emailAddress;
late String?  password;
  signUpWithEmailAndPassword() async
  {
    try {
      emit(signupLoadingState());
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress!,
    password: password!,
  );
  emit(signupSuccessState());
} on FirebaseAuthException catch (e) {

  if (e.code == 'weak-password') {
    emit(signupFailureState(error: 'The password provided is too weak.'));

  } else if (e.code == 'email-already-in-use') {
        emit(signupFailureState(error: 'The account already exists for that email.'));

  }
} catch (e) {
  emit(signupFailureState(error: e.toString()));
}
  }
}
