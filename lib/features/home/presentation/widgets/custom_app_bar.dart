import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;
    return
      AppBar(
      backgroundColor: AppColor.getAppBarColor(context),
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "أسانيـد",
                  style:  GoogleFonts.tajawal(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.getBlack(context),
                  ),
                ),
                Text(
                  "استكشاف الأسانيـد بصريًا",
                  style: GoogleFonts.tajawal(
                    fontSize: 12,
                    color: AppColor.getBlack(context),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 1),
            Image.asset(
              AssetsManager.brand,
              color: AppColor.primary,
              height: 55,
            ),
          ],
        ),
      ),
      leading: Column(
        children: [
          GestureDetector(
            onTap: () {
              themeManager.toggleTheme();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.07),
              ),
              child: Icon(
                isDark ? Icons.wb_sunny_rounded : Icons.nightlight_round,
                size: 24,
                color: isDark ? Colors.grey[400] : AppColor.primary,
              ),
            ),
          )



        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
