import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;
  const BackgroundScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: isDark
          ? const BoxDecoration(
        color: Color(0xFF111814),

      )
          : BoxDecoration(
        color: Color(0xffF9F7F2),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: child,
      ),
    );
  }
}
