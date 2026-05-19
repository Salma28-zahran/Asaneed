abstract class BooksStates {}

class BooksInitialState extends BooksStates {}

class BooksLoadingState extends BooksStates {}

class BooksSuccessState extends BooksStates {}

class BooksErrorState extends BooksStates {
  final String error;

  BooksErrorState(this.error);
}