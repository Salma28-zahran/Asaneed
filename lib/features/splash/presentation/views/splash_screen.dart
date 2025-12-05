import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, PageRouteName.homeScreen);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: ScaleTransition(
                scale: _animation,
                child: Image.asset(
                  'assets/images/png/splashScreen.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/images/png/loadingIcon.png',
                width: 120,
                height: 120,
              ),
            ),
          ),
        ],
      ),

    );
  }
}
