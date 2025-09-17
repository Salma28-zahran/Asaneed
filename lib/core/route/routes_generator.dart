import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/circle/presentation/views/circle1.dart';
import 'package:asaneed/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.circle1:
        return MaterialPageRoute(
          builder: (context) => const Circle1(),
          settings: settings,
       );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
    }
  }
}
