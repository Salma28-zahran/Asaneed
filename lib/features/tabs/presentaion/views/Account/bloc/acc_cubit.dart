import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'acc_states.dart';
import 'package:http/http.dart' as http;

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      // 🔹 call API (optional)
      if (token != null) {
        await http.post(
          Uri.parse(
            "http://167.99.94.194:8000/en/api/v1/accounts/users/logout/",
          ),
          headers: {
            "Authorization": "Bearer $token",
          },
        );
      }

      // 🔹 remove token
      await prefs.remove('token');

      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}