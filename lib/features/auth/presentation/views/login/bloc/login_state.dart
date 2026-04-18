abstract class LoginState{}

class LoginInitialState extends LoginState{}


class LogInLoadingState extends LoginState{}

class LogInSuccessState extends LoginState{}

class FailedToLogInState extends LoginState {
  final String message;
  FailedToLogInState({required this.message});
}

