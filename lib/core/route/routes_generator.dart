import 'package:asaneed/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
     // case PageRouteName.homeScreen:
     //   return MaterialPageRoute(
     //     builder: (context) => const HomeScreen(),
      //    settings: settings,
      //  );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
    }
  }
}
