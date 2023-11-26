
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {
  final String token;

  RegisterSuccessState({required this.token});
}
class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState({required this.error});
}
