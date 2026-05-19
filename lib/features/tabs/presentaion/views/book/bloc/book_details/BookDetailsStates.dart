abstract class BookDetailsStates {}

class BookDetailsInitialState
    extends BookDetailsStates {}

class BookDetailsLoadingState
    extends BookDetailsStates {}

class BookDetailsSuccessState
    extends BookDetailsStates {}

class BookDetailsErrorState
    extends BookDetailsStates {
  final String error;

  BookDetailsErrorState(this.error);
}