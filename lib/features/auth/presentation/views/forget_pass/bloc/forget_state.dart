abstract class PasswordResetState {}

class PasswordResetInitialState extends PasswordResetState {}

class RequestResetLoadingState extends PasswordResetState {}

class RequestResetSuccessState extends PasswordResetState {
  final String message;
  RequestResetSuccessState({required this.message});
}

class RequestResetErrorState extends PasswordResetState {
  final String error;
  RequestResetErrorState({required this.error});
}

class VerifyCodeLoadingState extends PasswordResetState {}

class VerifyCodeSuccessState extends PasswordResetState {
  final String message;
  VerifyCodeSuccessState({required this.message});
}

class VerifyCodeErrorState extends PasswordResetState {
  final String error;
  VerifyCodeErrorState({required this.error});
}

class CompleteResetLoadingState extends PasswordResetState {}

class CompleteResetSuccessState extends PasswordResetState {
  final String message;
  CompleteResetSuccessState({required this.message});
}

class CompleteResetErrorState extends PasswordResetState {
  final String error;
  CompleteResetErrorState({required this.error});
}