import 'dart:convert';

import 'package:asaneed/features/tabs/presentaion/views/book/bloc/books_list/BooksStates.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/data/BooksResponseModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../core/network/endpoints.dart';

class BooksCubit extends Cubit<BooksStates> {
  BooksCubit() : super(BooksInitialState());

  static BooksCubit get(context) => BlocProvider.of(context);

  BooksResponseModel? booksResponseModel;

  Future<void> getBooks() async {
    emit(BooksLoadingState());

    try {
      final response = await http.get(
        Uri.parse(
          '${Endpoints.baseUrl}/en/api/v1/books/books/',
        ),
        headers: {

        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        booksResponseModel = BooksResponseModel.fromJson(data);

        emit(BooksSuccessState());
      } else {
        emit(
          BooksErrorState(
            'Error : ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      emit(
        BooksErrorState(
          e.toString(),
        ),
      );
    }
  }
}