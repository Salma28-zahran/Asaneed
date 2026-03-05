import 'package:asaneed/features/tabs/presentaion/views/profile/widgets/option_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';

import '../../../../../core/route/routes.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeManager>().isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? Color(0xFF111814) : Color(0xFFF6F5F0),
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF111814) : Colors.white,
        centerTitle: true,
        title: Text(
          "حسابي",
          style: GoogleFonts.ibmPlexSans(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),

        leading: buildPopMenu(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  height: 150,
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFF2C3630) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1.5, color: AppColor.border),
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 56, // radius 28 × 2
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.primary.withOpacity(0.20),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person_2_outlined,
                            size: 30,
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "محمد مصطفي",
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColor.getBlack(context),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "mohamed@gmail.com",
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 16,
                                color: AppColor.grey3,
                              ),
                            ),
                            SizedBox(height: 6),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.primary.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "طالب",
                                style: GoogleFonts.ibmPlexSans(
                                  color: AppColor.getBlack(context),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 145,
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFF2C3630) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1.5, color: AppColor.border),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Row(
                          textDirection: TextDirection.rtl,

                          children: [
                            Icon(
                              Icons.light_mode_outlined,
                              size: 23,
                              color: AppColor.grey3,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "المظهر",
                              style: GoogleFonts.ibmPlexSans(
                                color: AppColor.getBlack(context),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      GestureDetector(
                        onTap: () {
                          context.read<AppThemeManager>().toggleTheme();
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 16,
                          ),

                          child: Row(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                isDark
                                    ? Icons.dark_mode_outlined
                                    : Icons.light_mode_outlined,
                                size: 27,
                                color: AppColor.grey3,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      isDark ? "الوضع النهاري" : "الوضع الليلي",
                                      style: GoogleFonts.ibmPlexSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.getBlack(context),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      isDark
                                          ? "الحالي: مفعل"
                                          : "الحالي: غير مفعل",
                                      style: GoogleFonts.ibmPlexSans(
                                        fontSize: 16,
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.primary.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  isDark ? "إيقاف" : "تشغيل",
                                  style: GoogleFonts.ibmPlexSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.getBlack(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFF2C3630) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1.5, color: AppColor.border),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Row(
                          textDirection: TextDirection.rtl,

                          children: [
                            Icon(
                              Icons.lock_outline_sharp,
                              size: 23,
                              color: AppColor.grey3,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "الدعم والقانوني",
                              style: GoogleFonts.ibmPlexSans(
                                color: AppColor.getBlack(context),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      OptionItem(
                        icon: Icons.lock_outline,
                        title: "سياسة الخصوصية",
                        subtitle: "اطلع علي كيفية التعامل مع بياناتك",
                        onTap: () {
                          Navigator.pushNamed(context, PageRouteName.privacy);
                        },
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      OptionItem(
                        icon: Icons.description_outlined,
                        title: "الشروط و الاحكام",
                        subtitle: "مراجعة شروط استخدام النموذج",
                        onTap: () {
                          Navigator.pushNamed(context, PageRouteName.terms);
                        },
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      OptionItem(
                        icon: Icons.mail_outline,
                        title: "تواصل معنا",
                        subtitle: "ارسل لنا رسالة",
                        onTap: () {
                          Navigator.pushNamed(context, PageRouteName.contact);
                        },
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          right: 16,
                        ),
                        child: Row(
                          textDirection: TextDirection.rtl,

                          children: [
                            Icon(Icons.logout, size: 23, color: Colors.red),
                            SizedBox(width: 10),
                            Text(
                              "تسجيل الخروج",
                              style: GoogleFonts.ibmPlexSans(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      isDark ? "الوضع النهاري" : "الوضع الليلي",
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
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
                    style: GoogleFonts.ibmPlexSans(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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
