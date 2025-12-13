import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const Color floatButtonbackgroundColor = Color(0xff0F9585); // Pink
  static const Color backgroundcolor = Color(0xFFF8F9FA);// Light gray
  static const Color textColorheadline1 = Color(0xFF000000); // Black
  static const Color textColorheadline2 = Color(0xFF424242); // Gray
  static const Color textColorbodyText1 = Color(0xFF666666); // Light gray
  static const Color textColorbodyText2 = Color(0xFF757575);


  ////////////primary////////
  static const Color primary = Color(0xff2F5D4B);
  /////primary2///////
  static const Color primary2 = Color(0xff4A8B71);

  static Color getPrimary2(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ?  Colors.black : primary2;
  }
  ///////primary 3//////
  static const Color primary3 = Color(0xff61f18f);


  ///////primary 4//////
  static const Color primary4 = Color(0xffA9C8BA);
  ///////primary 5//////

  static const Color primary5 = Color(0xff2C3630);


////////main colors////////////

////////grey////////
  static const Color grey = Color(0xff8e8e8e);
  static const Color grey2 = Color.fromARGB(255, 66, 66, 66);
  static const Color grey3= Color(0xFF9CA3AF);

  static const Color greylite200 = Color(0xFFEEEEEE);

  ///////black/////////
  static const Color black = Color(0xff000000);
  static Color getBlack(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.white : black;
  }
///////white/////////
  static const Color white = Color(0xffF8F9FD);
  static Color getWhite(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ?  Colors.black : const Color(0xFFF5F3FF)    ;
  }


////////app color///////
  static const Color appBarcolor = Color(0xffFFFFFF);
  static Color getAppBarColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ?  Colors.black : Colors.white;
  }

///////container color///////
  static Color getContainerColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFF1A221E) : Colors.white;
  }

  ///////border color//////
  static Color getborder(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ?  Color(0xff9CA3AF) : const Color(0xffE5E5DC)    ;
  }

////////الصحابه وتابعي القديم////
  static const Color purple = Color(0xFFF5F3FF);
  static const Color purple2 = Color(0xFF8B5CF6);
  static const Color pink = Color(0xffFDF2F8);
  static const Color pink2 = Color(0xffEC4899);


//////الصحابه////
  static const Color green = Color(0xFF166534);
  static const Color green2 = Color(0xFFE8F5E9);
  //////تابعي/////
  static const Color blue = Color(0xFF1976D2);
  static const Color blue2 = Color(0xFFE3F2FD);
  //////تابعي التابعين /////
  static const Color orange = Color(0xffFFF3E0);
  static const Color orange2 = Color(0xffE65100);


/////titles/////
  static const TextStyle titleStyle = TextStyle(
      fontSize: 14, color: AppColor.primary, fontWeight: FontWeight.w400);
  static const TextStyle titleStyle2 = TextStyle(
      fontSize: 20, color: AppColor.black, fontWeight: FontWeight.bold);
  static const TextStyle titleStyle3 =
  TextStyle(color: AppColor.primary, fontWeight: FontWeight.bold);
  static TextStyle title =
  TextStyle(color: AppColor.black, fontWeight: FontWeight.w600,fontSize: 18,fontFamily: "Arial Nova");

  static TextStyle title2 =
  GoogleFonts.inter(color: Color(0xff3F3F46), fontWeight: FontWeight.w500,fontSize: 12,);


///text style/////
  static TextStyle titleSahaba =
  GoogleFonts.ibmPlexSansArabic(color: AppColor.purple2, fontWeight: FontWeight.w500,fontSize: 14);

  static TextStyle titletabeen =
  GoogleFonts.ibmPlexSansArabic(color: AppColor.pink2, fontWeight: FontWeight.w500,fontSize: 14);

  static TextStyle titletabeen2 =
  GoogleFonts.ibmPlexSansArabic(color: AppColor.orange2, fontWeight: FontWeight.w500,fontSize: 14);



////////black text///////
  static TextStyle textBlack(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GoogleFonts.amiriQuran(
      color: isDark ? Colors.white : AppColor.black,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    );
  }

////primary text/////////
  static TextStyle textprimary =
  GoogleFonts.ibmPlexSansArabic(
    color: AppColor.primary,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  //////text grey///////
  static TextStyle textgrey =
  GoogleFonts.ibmPlexSansArabic(
    color: Color(0xff6B7280),
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
////////ahades text//////
  static TextStyle ahades(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 17,
      fontFamily: "Times New Roman",
    ).copyWith(
      color: isDark ? Colors.white : AppColor.black,
    );
  }



  static const TextStyle titleStyle4 =TextStyle(
      fontSize: 20, color: AppColor.black, fontWeight: FontWeight.w400);

  static const TextStyle textStylesmall =
  TextStyle(color: AppColor.primary, fontWeight: FontWeight.bold);

  static const TextStyle textStyleMeduim = TextStyle(
      fontSize: 20, color: AppColor.primary, fontWeight: FontWeight.bold);
  static const TextStyle textStyleLarge = TextStyle(
      fontSize: 30, color: AppColor.primary, fontWeight: FontWeight.bold);
}
///////theming//////
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
