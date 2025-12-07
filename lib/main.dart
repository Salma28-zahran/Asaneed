import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/features/home/provider/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'core/route/routes_generator.dart';
import 'package:provider/provider.dart';

import 'theme/AppThemeManager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();     // ★★ أهم حاجة لمنع الشاشة البيضا ★★

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => AppThemeManager()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<AppThemeManager>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeManager.currentTheme,
      onGenerateRoute: RoutesGenerator.onGenerateRoutes,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: child,
        );
      },
    );
  }
}
