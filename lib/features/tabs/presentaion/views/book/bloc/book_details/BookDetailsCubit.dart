import 'dart:convert';

import 'package:asaneed/core/network/endpoints.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/bloc/book_details/BookDetailsStates.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/data/BookDetailsModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class BookDetailsCubit
    extends Cubit<BookDetailsStates> {
  BookDetailsCubit()
      : super(BookDetailsInitialState());

  static BookDetailsCubit get(context) =>
      BlocProvider.of(context);

  BookDetailsModel? bookDetailsModel;

  Future<void> getBookDetails({
    required int id,
  }) async {
    emit(BookDetailsLoadingState());

    try {
      final response = await http.get(
        Uri.parse(
          '${Endpoints.baseUrl}/en/api/v1/books/books/$id/',
        ),
        headers: {
          'accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        bookDetailsModel =
            BookDetailsModel.fromJson(data);

        emit(BookDetailsSuccessState());
      } else {
        emit(
          BookDetailsErrorState(
            'Error : ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      emit(
        BookDetailsErrorState(
          e.toString(),
        ),
      );
    }
  }
}