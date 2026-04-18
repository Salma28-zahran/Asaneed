import 'dart:convert';

import 'package:asaneed/features/auth/presentation/views/forget_pass/bloc/forget_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PasswordResetCubit extends Cubit<PasswordResetState> {
  PasswordResetCubit() : super(PasswordResetInitialState());

  Future<void> requestReset({required String email}) async {
    if (email.isEmpty) {
      emit(RequestResetErrorState(error: "Email is required"));
      return;
    }

    emit(RequestResetLoadingState());

    try {
      final response = await http.post(Uri.parse(""), body: {"email": email});

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(
          RequestResetSuccessState(
            message: data["message"] ?? "Reset code sent",
          ),
        );
      } else {
        emit(
          RequestResetErrorState(error: data["message"] ?? "Request failed"),
        );
      }
    } catch (e) {
      emit(RequestResetErrorState(error: e.toString()));
    }
  }

  Future<void> verifyCode({required String email, required String code}) async {
    emit(VerifyCodeLoadingState());

    try {
      final response = await http.post(
        Uri.parse(""),

        body: jsonEncode({"email": email, "code": code}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(
          VerifyCodeSuccessState(message: data["message"] ?? "Code verified"),
        );
      } else {
        emit(VerifyCodeErrorState(error: data["message"] ?? "Invalid code"));
      }
    } catch (e) {
      emit(VerifyCodeErrorState(error: e.toString()));
    }
  }

  Future<void> completeReset({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    emit(CompleteResetLoadingState());

    try {
      final response = await http.post(
        Uri.parse(""),

        body: jsonEncode({
          "email": email,
          "code": code,
          "new_password": newPassword,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(
          CompleteResetSuccessState(
            message: data["message"] ?? "Password reset successfully",
          ),
        );
      } else {
        emit(CompleteResetErrorState(error: data["message"] ?? "Reset failed"));
      }
    } catch (e) {
      emit(CompleteResetErrorState(error: e.toString()));
    }
  }
}
