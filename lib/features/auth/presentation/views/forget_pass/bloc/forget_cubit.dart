import 'dart:convert';
import 'package:asaneed/features/auth/presentation/views/forget_pass/bloc/forget_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PasswordResetCubit extends Cubit<PasswordResetState> {
  PasswordResetCubit() : super(PasswordResetInitialState());

  final String baseUrl = "http://167.99.94.194:8000";

  final Map<String, String> headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
    'X-CSRFTOKEN':
    '6SlvlZX9r3jy0Sq9tQGazGpx5PMdGEbReuxKzJkmmfWSjRZ3coeRKxZIoher8jlA',
  };

  /// =========================
  /// 1) REQUEST RESET EMAIL
  /// =========================
  Future<void> requestReset({required String email}) async {
    if (email.isEmpty) {
      emit(RequestResetErrorState(error: "Email is required"));
      return;
    }

    emit(RequestResetLoadingState());

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/en/api/v1/accounts/auth/password-reset/"),
        headers: headers,
        body: jsonEncode({"email": email}),
      );

      print("REQUEST RESET STATUS: ${response.statusCode}");
      print("REQUEST RESET BODY: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(RequestResetSuccessState(
          message: data["message"] ?? "Reset code sent",
        ));
      } else {
        emit(RequestResetErrorState(
          error: data["message"] ?? "Request failed",
        ));
      }
    } catch (e) {
      print("REQUEST RESET ERROR: $e");
      emit(RequestResetErrorState(error: e.toString()));
    }
  }

  /// =========================
  /// 2) VERIFY RESET CODE
  /// =========================
  Future<void> verifyCode({
    required String email,
    required String code,
  }) async {
    emit(VerifyCodeLoadingState());

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/en/api/v1/accounts/auth/password-reset/verify/"),
        headers: headers,
        body: jsonEncode({
          "email": email,
          "reset_code": code,
        }),
      );

      print("VERIFY STATUS: ${response.statusCode}");
      print("VERIFY BODY: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(VerifyCodeSuccessState(
          message: data["message"] ?? "Code verified",
        ));
      } else {
        emit(VerifyCodeErrorState(
          error: data["message"] ?? "Invalid code",
        ));
      }
    } catch (e) {
      print("VERIFY ERROR: $e");
      emit(VerifyCodeErrorState(error: e.toString()));
    }
  }

  /// =========================
  /// 3) COMPLETE RESET PASSWORD
  /// =========================
  Future<void> completeReset({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(CompleteResetLoadingState());

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/en/api/v1/accounts/auth/password-reset/complete/"),
        headers: headers,
        body: jsonEncode({
          "email": email,
          "new_password": newPassword,
          "password_confirmation": confirmPassword,
        }),
      );

      print("COMPLETE RESET STATUS: ${response.statusCode}");
      print("COMPLETE RESET BODY: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(CompleteResetSuccessState(
          message: data["message"] ?? "Password reset successfully",
        ));
      } else {
        emit(CompleteResetErrorState(
          error: data["message"] ?? "Reset failed",
        ));
      }
    } catch (e) {
      print("COMPLETE RESET ERROR: $e");
      emit(CompleteResetErrorState(error: e.toString()));
    }
  }
}