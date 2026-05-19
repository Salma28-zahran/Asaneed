import 'package:asaneed/features/tabs/presentaion/views/book/data/BookPagesModel.dart';

abstract class BookPagesState {}

class BookPagesInitial extends BookPagesState {}

class BookPagesLoading extends BookPagesState {}

class BookPagesSuccess extends BookPagesState {
  final BookPagesModel model;

  BookPagesSuccess(this.model);
}

class BookPagesError extends BookPagesState {
  final String error;

  BookPagesError(this.error);
}