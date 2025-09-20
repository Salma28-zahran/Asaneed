import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;
  const BackgroundScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.background), // صورتك
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // علشان الخلفية تبان
        body: child,
      ),
    );
  }
}
