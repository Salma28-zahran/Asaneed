abstract class ActivState {}

class ActivInitialState extends ActivState {}


class SendActivateLoadingState extends ActivState {}

class SendActivateSuccessState extends ActivState {
  final String message;
  SendActivateSuccessState({required this.message});
}

class FailedToSendActivateState extends ActivState {
  final String error;
  FailedToSendActivateState({required this.error});
}


class ActivateLoadingState extends ActivState {}

class ActivateSuccessState extends ActivState {
  final String message;
  ActivateSuccessState({this.message = "Account activated successfully"});
}

class FailedToActivateState extends ActivState {
  final String message;
  FailedToActivateState({required this.message});
}