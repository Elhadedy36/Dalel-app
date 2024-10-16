
 class AuthState {}

final class AuthInitial extends AuthState {}
final class signupLoadingState extends AuthState {}
final class signupSuccessState extends AuthState {}
final class signupFailureState extends AuthState {
  final String error;
  signupFailureState({required this.error});
}
final class TermsAndConditionsUpdateState extends AuthState {}
final class obsecureTextState extends AuthState {
  
}

final class signinLoadingState extends AuthState {}
final class signinSuccessState extends AuthState {}
final class signinFailureState extends AuthState {
  final String error;
  signinFailureState({required this.error});
}

final class ResetPasswordLoadingState extends AuthState {}
final class ResetPasswordSuccessState extends AuthState {}
final class ResetPasswordFailureState extends AuthState {
  final String error;
  ResetPasswordFailureState({required this.error});
} 