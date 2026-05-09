import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/features/home/presentation/widgets/check_login.dart';
import 'package:asaneed/features/home/provider/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'core/route/routes_generator.dart';
import 'package:provider/provider.dart';
import 'features/tabs/presentaion/views/Account/bloc/acc_cubit.dart';
import 'features/tabs/presentaion/views/hadith/logic/bloc/cubit/hadith_cubit.dart';
import 'features/tabs/presentaion/views/home_page2.dart';
import 'theme/AppThemeManager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => AppThemeManager()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HadithCubit()..loadHadith()),
          BlocProvider(create: (_) => LogoutCubit()),
        ],

        child: const MyApp(),
      ),
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
      home: CheckLogin(),
      theme: themeManager.currentTheme,
      onGenerateRoute: RoutesGenerator.onGenerateRoutes,
      builder: (context, child) {
        return Scaffold(backgroundColor: Colors.transparent, body: child);
      },
    );
  }
}
