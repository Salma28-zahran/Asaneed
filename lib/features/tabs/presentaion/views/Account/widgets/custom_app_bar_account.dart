import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:asaneed/theme/AppThemeManager.dart';

import '../../../../../../theme/app_theme.dart';

class CustomAppBarAccount extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? popMenu;

  const CustomAppBarAccount({
    super.key,
    required this.title,
    this.popMenu,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeManager>().isDarkMode;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppBar(
        backgroundColor: AppColor.getAppBarColor(context),

        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,

        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios_new, size: 20,color:AppColor.grey3 ,),
          onPressed: () => Navigator.pop(context),
        ),

        actions: [
          buildPopMenu(context),
        ],        title: Text(
          title,
          style: GoogleFonts.ibmPlexSans(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Widget buildPopMenu(BuildContext context) {
    final isDark = context.watch<AppThemeManager>().isDarkMode;

    return PopupMenuButton<int>(
      icon: Icon(Icons.more_vert, color: AppColor.grey3),
      offset: Offset(0, 52),
      color: isDark ? AppColor.primary5 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: AppColor.border, width: 1.5),
      ),
      itemBuilder:
          (context) => [
        /// Dark Mode
        PopupMenuItem(
          value: 0,
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFdbeafe),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isDark ? "ليلي" : "نهاري",
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  isDark ? "الوضع النهاري" : "الوضع الليلي",
                  style: GoogleFonts.scheherazadeNew(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Icon(
                isDark
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                size: 20,
                color: AppColor.grey3,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          enabled: false,
          height: 8,
          child: Divider(thickness: 1.5, color: AppColor.border),
        ),

        /// Logout
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.logout, color: AppColor.grey3, size: 20),
              SizedBox(width: 15),
              Text(
                "تسجيل الخروج",
                style: GoogleFonts.scheherazadeNew(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 0) {
          context.read<AppThemeManager>().toggleTheme();
        } else if (value == 2) {}
      },
    );
  }

}