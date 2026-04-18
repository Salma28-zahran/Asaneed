import 'dart:convert';
import 'package:asaneed/features/auth/presentation/views/activation/bloc/activ_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


class ActivateCubit extends Cubit<ActivState> {
  ActivateCubit() : super(ActivInitialState());

  Future<void> sendActivate({required String email}) async {
    if (email.isEmpty) {
      emit(FailedToSendActivateState(error: "Email is required"));
      return;
    }

    emit(SendActivateLoadingState());

    try {
      final response = await http.post(
        Uri.parse(""),

        body: jsonEncode({
          "email": email,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("✅ Send Activate Success: $data");

        emit(SendActivateSuccessState(
          message: data["Message"] ?? "Code sent successfully",
        ));
      } else {
        final errorMessage =
            data['message'] ?? data['error'] ?? "Failed to send code";

        emit(FailedToSendActivateState(error: errorMessage));
      }
    } catch (e) {
      emit(FailedToSendActivateState(error: e.toString()));
    }
  }

  Future<void> activateAccount({
    required String email,
    required int activationCode,
  }) async {
    if (email.isEmpty) {
      emit(FailedToActivateState(message: "Email is required"));
      return;
    }
    emit(ActivateLoadingState());

    try {
      final response = await http.post(
        Uri.parse(""),

        body: jsonEncode({
          "email": email,
          "activation_code": activationCode.toString(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("✅ Activated successfully: $data");

        emit(ActivateSuccessState(
          message: data["message"] ?? "Account activated successfully",
        ));
      } else {
        final errorMessage =
            data['message'] ?? data['error'] ?? "Activation failed";

        emit(FailedToActivateState(message: errorMessage));
      }
    } catch (e) {
      emit(FailedToActivateState(message: e.toString()));
    }
  }
}