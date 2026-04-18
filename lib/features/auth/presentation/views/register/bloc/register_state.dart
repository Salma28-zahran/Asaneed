abstract class RegisterState{}

class RegisterInitialState extends RegisterState{}

class RegisterLoadingState extends RegisterState{}

class RegisterSuccessState extends RegisterState{}

class FailedToRegisterState extends RegisterState{
  String message;
  FailedToRegisterState({required this.message});
}
