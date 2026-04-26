import 'dart:convert';
import 'package:asaneed/features/auth/presentation/views/activation/bloc/activ_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ActivateCubit extends Cubit<ActivState> {
  ActivateCubit() : super(ActivInitialState());

  final String baseUrl = "http://167.99.94.194:8000";

  /// Send activation code
  Future<void> sendActivate({required String email}) async {
    if (email.isEmpty) {
      emit(FailedToSendActivateState(error: "Email is required"));
      return;
    }

    emit(SendActivateLoadingState());

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/en/api/v1/accounts/auth/activate/"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "email": email,
        }),
      );

      final data = jsonDecode(response.body);

      debugPrint("📩 Send Activate Response: $data");

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(SendActivateSuccessState(
          message: data["message"] ?? "Code sent successfully",
        ));
      } else {
        emit(FailedToSendActivateState(
          error: data["message"] ?? data["error"] ?? "Failed to send code",
        ));
      }
    } catch (e) {
      emit(FailedToSendActivateState(error: e.toString()));
    }
  }

  /// Activate account
  Future<void> activateAccount({
    required String email,
    required String activationCode,
  }) async {
    if (email.isEmpty) {
      emit(FailedToActivateState(message: "Email is required"));
      return;
    }

    emit(ActivateLoadingState());

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/en/api/v1/accounts/auth/activate/"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "activation_code": activationCode,
        }),
      );

      final data = jsonDecode(response.body);

      debugPrint("✅ Activate Response: $data");

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(ActivateSuccessState(
          message: data["message"] ?? "Account activated successfully",
        ));
      } else {
        emit(FailedToActivateState(
          message: data["message"] ?? data["error"] ?? "Activation failed",
        ));
      }
    } catch (e) {
      emit(FailedToActivateState(message: e.toString()));
    }
  }
}