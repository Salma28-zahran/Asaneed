import 'package:flutter/material.dart';
import 'core/route/routes_generator.dart';
import 'core/route/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //initialRoute: PageRouteName.homeScreen,

      onGenerateRoute: RoutesGenerator.onGenerateRoutes,
    );
  }
}
