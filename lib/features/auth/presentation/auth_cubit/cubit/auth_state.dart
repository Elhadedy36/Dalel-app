
 class AuthState {}

final class AuthInitial extends AuthState {}
final class signupLoadingState extends AuthState {}
final class signupSuccessState extends AuthState {}
final class signupFailureState extends AuthState {
  final String error;
  signupFailureState({required this.error});
}