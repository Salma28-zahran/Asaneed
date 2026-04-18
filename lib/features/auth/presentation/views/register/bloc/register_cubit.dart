import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  void register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (name.isEmpty) {
      emit(FailedToRegisterState(message: "Name is required"));
      return;
    }

    if (password != confirmPassword) {
      emit(FailedToRegisterState(message: "Passwords do not match"));
      return;
    }

    emit(RegisterLoadingState());

    try {
      final response = await http.post(
        Uri.parse(""),
        headers: {
          'lang': "en",
        },
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(responseBody);
        emit(RegisterSuccessState());
      } else {
        print(responseBody);

        final errorMessage =
            responseBody['message'] ??
                responseBody['error'] ??
                "Unknown error";

        emit(FailedToRegisterState(message: errorMessage));
      }
    } catch (e) {
      emit(FailedToRegisterState(message: e.toString()));
    }
  }
}