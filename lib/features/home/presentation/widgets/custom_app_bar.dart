import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/core/route/routes.dart';
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

    return AppBar(
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
                  style: GoogleFonts.tajawal(
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
            const SizedBox(width: 6),
            Image.asset(
              AssetsManager.brand,
              color: AppColor.primary,
              height: 55,
            ),
          ],
        ),
      ),

      leadingWidth: 150,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.more_vert,color: AppColor.primary,),
            onPressed: () {
              showOptionsSheet(context);
            },
          ),


          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, PageRouteName.search);
            },
            icon: Icon(
              Icons.search,
              color: AppColor.primary,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, PageRouteName.profile2);
            },
            icon: Icon(
              Icons.person,
              color: AppColor.primary,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
void showOptionsSheet(BuildContext context) {
  final themeManager = context.read<AppThemeManager>();
  final isDark = themeManager.isDarkMode;

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration:  BoxDecoration(
          color: AppColor.getContainerColor(context),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const SizedBox(height: 10),

            /// handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 20),

            /// header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "خيارات",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const Divider(),

            /// Dark Mode
            ListTile(
              trailing: Icon(
                isDark ? Icons.wb_sunny_outlined : Icons.nightlight_outlined,
                color: Colors.grey,
              ),
              title: Text(
                isDark ? "الوضع الصباحي" : "الوضع الليلي",
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                themeManager.toggleTheme();
                Navigator.pop(context);
              },
            ),

            const Divider(),

            /// Account
            ListTile(
              trailing: const Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
              title: const Text(
                "الحساب",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, PageRouteName.profile2);
              },
            ),

            const Divider(),

            /// Logout
            ListTile(
              trailing: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                "تسجيل الخروج",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.login);
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}