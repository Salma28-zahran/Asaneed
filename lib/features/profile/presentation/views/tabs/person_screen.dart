import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF111814) : const Color(0xFFF9F7F2),
      body: Stack(
        children: [
          /// -------- Center Empty State --------
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark
                        ? Colors.white.withOpacity(0.08)
                        : Colors.black.withOpacity(0.06),
                  ),
                  child: Icon(
                    Icons.person_outline,
                    size: 40,
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "لا يوجد شيوخ",
                  style: GoogleFonts.tajawal(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColor.getBlack(context),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "لم يتم العثور على شيوخ مسجلين لهذا الراوي.",
                  style: GoogleFonts.tajawal(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          /// -------- Page Title (Top Right) --------
          Positioned(
            top: 24,
            right: 28,
            child: Text(
              "شيوخه",
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: AppColor.getBlack(context),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
