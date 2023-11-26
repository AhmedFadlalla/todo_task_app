
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}
class LogoutLoadingState extends LogoutState {}
class LogoutSuccessState extends LogoutState {
  final String message;

  LogoutSuccessState({required this.message});
}
class LogoutErrorState extends LogoutState {
  final String error;

  LogoutErrorState({required this.error});
}
