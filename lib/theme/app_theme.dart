import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const Color floatButtonbackgroundColor = Color(0xff0F9585); // Pink
  static const Color backgroundIcon = Color(0xFFFFFFFF); // White
  // static const Color textColor = Color(0xFF333333); // Dark gray
  static const Color backgroundcolor = Color(0xFFF8F9FA); // Light gray
  static const Color textColorheadline1 = Color(0xFF000000); // Black
  static const Color textColorheadline2 = Color(0xFF424242); // Gray
  static const Color textColorbodyText1 = Color(0xFF666666); // Light gray
  static const Color textColorbodyText2 = Color(0xFF757575); // Medium gray
  static const Color primary = Color(0xff4A8B71);
  static const Color primary2 = Color(0xffE8FFFC);
  static Color getPrimary2(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ?  Colors.black : primary2;
  }
  static const Color primary3 = Color(0xff61f18f);




  // You can define more colors as per your requirement
  static const ButtonThemeData buttonTheme = ButtonThemeData(
    buttonColor: primary, // Button color
    textTheme: ButtonTextTheme.primary, // Use primary color for text
  );

  /// Old Data

  static const Color grey = Color(0xff8e8e8e);
  static const Color grey2 = Color.fromARGB(255, 66, 66, 66);
  static const Color greylite200 = Color(0xFFEEEEEE);
  static const Color black = Color(0xff000000);
  static Color getBlack(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.white : black;
  }

  static const Color white = Color(0xffF8F9FD);
  static Color getWhite(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ?  Colors.black : const Color(0xFFF5F3FF)    ;
  }

  static const Color blue = Color(0xFF90CAF9);
  static const Color blue2 = Color(0xFF0059A1); //Color(0xFF42A5F5);

  static const Color appBarcolor = Color(0xFFF5F3FF);
  static Color getAppBarColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ?  Colors.black : const Color(0xFFF5F3FF);
  }


  static const Color purple = Color(0xFFF5F3FF);
  static const Color purple2 = Color(0xFF8B5CF6);
  static const Color pink = Color(0xffFDF2F8);
  static const Color pink2 = Color(0xffEC4899);
  static const Color orange = Color(0xffFFF1E6);
  static const Color orange2 = Color(0xffFF9B4D);











  static const Color primaryColor = Color(0xFF0059A1); //Color(0xff5DB1DF);

  static Color backgroundcardcolor = const Color(0xFF0059A1).withOpacity(0.5);

  //static const Color primaryColor = Color(0xffe74c3c);
  //static const Color secondColor = Color(0xffc0392b);
  static const Color secondColor = Color(0xFF90CAF9);
  static const Color fourthColor = Color(0xff0d3056);
  static const Color thirdColor = Color.fromARGB(52, 255, 179, 170);
  static const Color textcolor = Colors.white;

  static const Color mainColor = Color(0xff006533);
  static const Color secondMainColor = Color(0xff93BF1E);
  static const Color mainColorWhite = Colors.white;
  static const Color mainColorBlack = Colors.black87;
  static const Color kLightGoldColor1 = Color(0xffF3E184);
  static const Color kLightGoldColor = Color(0xfff5b324);
  static const Color kBGColor = Color(0xfff4f4f4);

  static const Color kPrimaryColor = Color(0xFF0059A1); //Color(0xFF1492E6);
  static Color kAccentColor = const Color(0xFF1492E6).withOpacity(0.3);
  static const Color kLightGreyColor = Color(0xFFB5B5B5);
  static const Color kGreyColor = Color(0xFFF2F2F2);
  static const Color kDarkGreyColor = Color(0xFF555555);
  static const Color kBackgroundColor = Colors.white;
///////////////////mine
  static const Color backgroundbox = AppColor.blue2;
  static const Color backgroundbox2 = AppColor.blue;
  static const Color backgroundboxlite = AppColor.white;
  static const Color listviewbackground = AppColor.white;

  static const MaterialColor primarySwatchbackgroundColor = Colors.deepPurple;

  static const Color titleColor = AppColor.white;

  static const Color textColorAppbar = AppColor.blue2;
  static const Color textColorDisabled = AppColor.grey;

  static const Color appBarBackground = AppColor.white;

  static const Color buttonBackground = AppColor.blue2;

  static const Color buttonBackgroundDisable = AppColor.grey;
  static const Color buttontitle = AppColor.primaryColor;
  static const Color buttontextColor = AppColor.white;

  static Gradient kBlackGradient =
  const RadialGradient(colors: [mainColor, secondMainColor], radius: 4);
  static Gradient kGoldGradient =
  const RadialGradient(colors: [kLightGoldColor, mainColor], radius: 4);

  static const TextStyle titleStyle = TextStyle(
      fontSize: 14, color: AppColor.titleColor, fontWeight: FontWeight.w400);
  static const TextStyle titleStyle2 = TextStyle(
      fontSize: 20, color: AppColor.black, fontWeight: FontWeight.bold);
  static const TextStyle titleStyle3 =
  TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold);


  ///////////////الصحابه//////

  static TextStyle title =
  TextStyle(color: AppColor.black, fontWeight: FontWeight.w600,fontSize: 18,fontFamily: "Arial Nova");

  static TextStyle title2 =
  GoogleFonts.inter(color: Color(0xff3F3F46), fontWeight: FontWeight.w500,fontSize: 12,);



  static TextStyle titleSahaba =
  GoogleFonts.inter(color: AppColor.purple2, fontWeight: FontWeight.w500,fontSize: 14);

  static TextStyle titletabeen =
  GoogleFonts.inter(color: AppColor.pink2, fontWeight: FontWeight.w500,fontSize: 14);

  static TextStyle titletabeen2 =
  GoogleFonts.inter(color: AppColor.orange2, fontWeight: FontWeight.w500,fontSize: 14);





  static const TextStyle titleStyle4 =TextStyle(
      fontSize: 20, color: AppColor.black, fontWeight: FontWeight.w400);

  static const TextStyle textStylesmall =
  TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold);

  static const TextStyle textStyleMeduim = TextStyle(
      fontSize: 20, color: AppColor.primaryColor, fontWeight: FontWeight.bold);
  static const TextStyle textStyleLarge = TextStyle(
      fontSize: 30, color: AppColor.primaryColor, fontWeight: FontWeight.bold);
}

ThemeData themeEnglish = ThemeData();
ThemeData themeArabic = ThemeData();

BoxDecoration kBoxDecoration = BoxDecoration(
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(10),
);
final containerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    border: Border.all(color: Colors.black54, width: 0.2));

double sizeFromHeight(
    {bool removeAppBarSize = true,
      required double fraction,
      required BuildContext context}) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  fraction = (removeAppBarSize
      ? (mediaQuery.size.height -
      AppBar().preferredSize.height -
      mediaQuery.padding.top)
      : (mediaQuery.size.height)) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(
    {required double fraction, required BuildContext context}) {
  fraction = MediaQuery.of(context).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}

class ColorManager {
  static Color lightGolden = HexaColor.fromHexa("#F3E184");
  static Color golden = HexaColor.fromHexa("#BA8B31");
}

extension HexaColor on Color {
  static Color fromHexa(hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }


}

// 🌞 Light Theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColor.backgroundcolor,
  primaryColor: AppColor.primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColor.white,
    foregroundColor: AppColor.textColorheadline1,
    elevation: 0,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.inter(
      color: AppColor.textColorheadline1,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headlineMedium: GoogleFonts.inter(
      color: AppColor.textColorheadline2,
      fontSize: 20,
    ),
    bodyLarge: GoogleFonts.inter(
      color: AppColor.textColorbodyText1,
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.inter(
      color: AppColor.textColorbodyText2,
      fontSize: 14,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColor.textColorheadline1),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.floatButtonbackgroundColor,
  ),
  cardColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: AppColor.primary,
    secondary: AppColor.primary3,
    surface: Colors.white,
    background: AppColor.backgroundcolor,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: AppColor.textColorheadline1,
    onSurface: AppColor.textColorheadline2,
  ),
);

// 🌑 Dark Theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff888888),
  primaryColor: AppColor.primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(color: Colors.white),
    headlineSmall: TextStyle(color: Colors.white70),
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    bodySmall: TextStyle(color: Colors.white60),
  ),
  iconTheme: const IconThemeData(color: Colors.white70),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primary,
  ),
  cardColor: const Color(0xFF1E1E1E),
  colorScheme: const ColorScheme.dark(
    primary: AppColor.primary,
    secondary: AppColor.primary3,
    surface: Color(0xFF1E1E1E),
    background: Color(0xFF121212),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onBackground: Colors.white70,
    onSurface: Colors.white,
  ),
);
