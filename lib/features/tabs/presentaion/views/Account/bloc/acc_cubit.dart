import 'dart:convert';
import 'package:asaneed/features/tabs/presentaion/views/Account/bloc/acc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitialState());

  Future<void> logout({required String token}) async {
    emit(LogoutLoadingState());

    try {
      final response = await http.post(
        Uri.parse(""),

      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(LogoutSuccessState());
      } else {
        emit(LogoutErrorState(
          message: data["message"] ?? "Logout failed",
        ));
      }
    } catch (e) {
      emit(LogoutErrorState(message: e.toString()));
    }
  }
}