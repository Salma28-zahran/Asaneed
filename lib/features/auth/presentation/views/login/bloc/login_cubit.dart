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
    print("🚀 Login started");

    if (email.isEmpty || password.isEmpty) {
      print("❌ Empty fields");
      emit(FailedToLogInState(message: "Email and password are required"));
      return;
    }

    emit(LogInLoadingState());
    print("⏳ Loading...");

    try {
      final url =
          "http://167.99.94.194:8000/en/api/v1/accounts/auth/login/";

      print("📡 URL: $url");

      final body = {
        "email": email,
        "password": password,
      };

      print("📦 Request Body: $body");

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );

      print("📥 Status Code: ${response.statusCode}");
      print("📥 Response: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        print("✅ Login Success");
        emit(LogInSuccessState());
      } else {
        print("❌ Login Failed");
        emit(FailedToLogInState(
          message: data["message"] ?? "Invalid email or password",
        ));
      }
    } catch (e) {
      print("🔥 Error: $e");
      emit(FailedToLogInState(message: e.toString()));
    }
  }
}