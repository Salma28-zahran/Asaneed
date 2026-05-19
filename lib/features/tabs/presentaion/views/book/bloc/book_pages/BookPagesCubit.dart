import 'dart:convert';

import 'package:asaneed/core/network/endpoints.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/bloc/book_pages/BookPagesState.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/data/BookPagesModel.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

class BookPagesCubit extends Cubit<BookPagesState> {
  BookPagesCubit() : super(BookPagesInitial());

  BookPagesModel? model;

  Future<void> getBookPages({
    required int id,
  }) async {

    emit(BookPagesLoading());

    try {

      final response = await http.get(
        Uri.parse(
          '${Endpoints.baseUrl}/en/api/v1/books/books/$id/pages/',
        ),

        headers: {
          'accept': 'application/json',
        },
      );

      print("STATUS CODE: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);

        model = BookPagesModel.fromJson(data);

        emit(BookPagesSuccess(model!));

      } else {

        emit(
          BookPagesError(
            'Server Error: ${response.statusCode}',
          ),
        );
      }

    } catch (e) {

      print(e);

      emit(
        BookPagesError(
          e.toString(),
        ),
      );
    }
  }
}