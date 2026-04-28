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
    print("🚀 Register function started");

    if (name.isEmpty) {
      print("❌ Name is empty");
      emit(FailedToRegisterState(message: "Name is required"));
      return;
    }

    if (password != confirmPassword) {
      print("❌ Passwords do not match");
      emit(FailedToRegisterState(message: "Passwords do not match"));
      return;
    }

    emit(RegisterLoadingState());
    print("⏳ Loading state emitted");

    try {
      final url =
          "http://167.99.94.194:8000/en/api/v1/accounts/auth/register/";

      print("📡 Sending request to: $url");

      final requestBody = {
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "full_name": name,

      };

      print("📦 Request Body: $requestBody");

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      print("📥 Status Code: ${response.statusCode}");
      print("📥 Raw Response: ${response.body}");

      final responseBody = jsonDecode(response.body);

      print("📊 Parsed Response: $responseBody");

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        print("✅ Registration Success");
        emit(RegisterSuccessState());
      } else {
        final errorMessage =
            responseBody['message'] ??
                responseBody['error'] ??
                responseBody.toString();

        print("❌ Registration Failed");
        print("❗ Error Message: $errorMessage");

        emit(FailedToRegisterState(message: errorMessage));
      }
    } catch (e) {
      print("🔥 Exception caught: $e");
      emit(FailedToRegisterState(message: e.toString()));
    }
  }
}