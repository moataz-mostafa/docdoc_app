class RegisterStates {}

class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{
  final String userName;
  final String token;

  RegisterSuccessState({required this.userName, required this.token});
}
class RegisterErrorState extends RegisterStates{
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}