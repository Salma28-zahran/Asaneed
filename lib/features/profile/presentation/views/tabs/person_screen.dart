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

    final bool hasData = true;

    return Scaffold(
     backgroundColor: Colors.transparent,
      body: SafeArea(
        child: hasData
            ? _buildList(context, isDark)
            : _buildEmptyState(context, isDark),
      ),
    );
  }
}

/// ================= EMPTY STATE =================

Widget _buildEmptyState(BuildContext context, bool isDark) {
  return Center(
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
  );
}

/// ================= LIST =================

Widget _buildList(BuildContext context, bool isDark) {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: 4,
    itemBuilder: (context, index) {
      return _personCard(context, isDark);
    },
  );
}

/// ================= CARD =================

Widget _personCard(BuildContext context, bool isDark) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColor.getContainerColor(context),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: AppColor.getborder(context),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// ===== Top Row =====
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Back Arrow (Left)
            Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.grey.shade500,
            ),

            /// Name + Avatar
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "أبو ذر الغفاري",
                      style: GoogleFonts.tajawal(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.getBlack(context),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "ت. AH 32",
                      style: GoogleFonts.tajawal(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.withOpacity(0.15),
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 3),

        /// ===== Trust Row =====
        Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "ثقة",
                style: GoogleFonts.tajawal(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.verified_outlined,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),

        const SizedBox(height: 2),

        /// ===== Description =====
        Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Text(
            "من السابقين إلى الإسلام، عُرف بالزهد والتقوى.",
            textAlign: TextAlign.right,
            style: GoogleFonts.tajawal(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ],
    ),
  );
}