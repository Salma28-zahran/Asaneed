import 'package:asaneed/features/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/widgets/background_screen.dart';
import '../views/home_screen.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({super.key});

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  bool isLoading = true;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");

    if (token != null && token.isNotEmpty) {
      isLoggedIn = true;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      child: isLoggedIn
          ? HomeScreen()
          : OnBoarding(),
    );


  }
}
