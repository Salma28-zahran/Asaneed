import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/auth/presentation/views/forget_pass/forget_email.dart';
import 'package:asaneed/features/auth/presentation/views/forget_pass/new_pass.dart';
import 'package:asaneed/features/auth/presentation/views/login_screen.dart';
import 'package:asaneed/features/auth/presentation/views/register_screen.dart';
import 'package:asaneed/features/auth/presentation/views/verify_otp.dart';
import 'package:asaneed/features/circle/presentation/views/circle1.dart';
import 'package:asaneed/features/details/presentation/views/sahaba_details.dart';
import 'package:asaneed/features/home/presentation/views/home_screen.dart';
import 'package:asaneed/features/onboarding/onboarding.dart';
import 'package:asaneed/features/profile/presentation/views/profile_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/rwah_screen.dart';
import 'package:asaneed/features/tabs/presentaion/views/hadethscreen.dart';
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
      case PageRouteName.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding(),
          settings: settings,
        );
      case PageRouteName.hadethScreen:
        return MaterialPageRoute(
          builder: (context) => const Hadethscreen(),
          settings: settings,
        );
      case PageRouteName.profile:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: ProfileScreen(),
          ),
          settings: settings,
        );
      case PageRouteName.login:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: LoginScreen(),
          ),
          settings: settings,
        );
      case PageRouteName.register:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: RegisterScreen(),
          ),
          settings: settings,
        );
      case PageRouteName.verify_otp:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: VerifyOtp(),
          ),
          settings: settings,
        );
      case PageRouteName.forget_email:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: ForgetEmail(),
          ),
          settings: settings,
        );
      case PageRouteName.new_pass:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: NewPass(),
          ),
          settings: settings,
        );


      default:
        return MaterialPageRoute(
          builder: (context) => const BackgroundScreen(
            child: OnBoarding(),
          ),
          settings: settings,
        );
    }
  }
}
