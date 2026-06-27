abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String userName;
  final String token;

  LoginSuccessState({required this.userName, required this.token});
}

class LoginErrorState extends LoginStates {
  final String errorMessage;

  LoginErrorState({required this.errorMessage});
}
