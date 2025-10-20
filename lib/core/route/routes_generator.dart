import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/circle/presentation/views/circle1.dart';
import 'package:asaneed/features/details/presentation/views/sahaba_details.dart';
import 'package:asaneed/features/home/presentation/views/home_screen.dart';
import 'package:asaneed/features/splash/presentation/views/splash_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/rwah_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/settings/info_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/settings/terms_screen.dart';
import 'package:asaneed/features/tree/presentation/views/tree_screen.dart';
import 'package:flutter/material.dart';
import 'package:asaneed/core/widgets/background_screen.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.circle1:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: Circle1(),
          ),
          settings: settings,
        );

      case PageRouteName.details:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: SahabaDetails(),
          ),
          settings: settings,
        );

      case PageRouteName.rwah:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: RwahScreen(),
          ),
          settings: settings,
        );


      case PageRouteName.tree:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: TreeScreen(),
          ),
          settings: settings,
        );
      case PageRouteName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: HomeScreen(),
          ),
          settings: settings,
        );
      case PageRouteName.terms:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: TermsScreen(),
          ),
          settings: settings,
        );
      case PageRouteName.info:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: InfoScreen(),
          ),
          settings: settings,
        );


      default:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: AnimatedSplashScreen(),
          ),
          settings: settings,
        );
    }
  }
}
