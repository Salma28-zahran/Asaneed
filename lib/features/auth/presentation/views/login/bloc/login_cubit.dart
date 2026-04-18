import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void login({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) {
      emit(FailedToLogInState(message: "Invalid email or password."));
      return;
    }

    if (password.isEmpty) {
      emit(FailedToLogInState(message: "Invalid email or password."));
      return;
    }

    emit(LogInLoadingState());

    try {
      final response = await http.post(
        Uri.parse(""),
        body: {
          'email': email,
          'password': password,
        },
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(responseBody);
        emit(LogInSuccessState());
      } else {
        print(responseBody);
        emit(FailedToLogInState(message: "Invalid email or password."));
      }
    } catch (e) {
      emit(FailedToLogInState(message: "Invalid email or password."));
    }
  }
}