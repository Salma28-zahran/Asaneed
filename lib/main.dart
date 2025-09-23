import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:flutter/material.dart';
import 'core/route/routes_generator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.background),
          fit: BoxFit.cover,
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesGenerator.onGenerateRoutes,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: child,
          );
        },
      ),
    );
  }
}
