import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/route/routes.dart';
import '../../../../../../theme/AppThemeManager.dart';

class SahabaCard extends StatelessWidget {
  final String name;
  final String description;
  final int hadithCount;
  final String deathYear;
  final String status1;
  final String status2;

  const SahabaCard({
    super.key,
    required this.name,
    required this.description,
    required this.hadithCount,
    required this.deathYear,
    required this.status1,
    required this.status2,
  });

  Color getBgColor() {
    switch (status1) {
      case "تابعي":
        return Colors.lightBlue.withOpacity(0.2);
      case "تابع التابعي":
        return Colors.orange.withOpacity(0.2);
      default: // صحابي
        return Colors.green.withOpacity(0.15);
    }
  }

  Color getTextColor() {
    switch (status1) {
      case "تابعي":
        return Colors.blue;
      case "تابع التابعي":
        return Colors.red;
      default:
        return AppColor.primary2;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, PageRouteName.profile);
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.getContainerColor(context),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.border, width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Row
              Row(
                children: [
                  Text(
                    name,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 18,
                      color: AppColor.getBlack(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  PopupMenuButton<int>(
                    icon: Icon(Icons.more_vert, color: AppColor.grey3),
                    offset: Offset(0, 45),
                    color: isDark ? AppColor.primary5 : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: AppColor.border, width: 1.5),
                    ),

                    itemBuilder:
                        (context) => [
                          PopupMenuItem(
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Expanded(
                                  child: Text(
                                    "حفظ الراوي",
                                    style: GoogleFonts.scheherazadeNew(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Icon(
                                  Icons.bookmark_border,
                                  size: 20,
                                  color: AppColor.grey3,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            padding: EdgeInsets.zero,
                            enabled: false,
                            height: 8,
                            child: Divider(
                              thickness: 1.5,
                              color: AppColor.border,
                            ),
                          ),
                          PopupMenuItem(
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Expanded(
                                  child: Text(
                                    "عرض الملف",
                                    style: GoogleFonts.scheherazadeNew(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Icon(
                                  Icons.person,
                                  size: 20,
                                  color: AppColor.grey3,
                                ),
                              ],
                            ),
                          ),

                          PopupMenuItem(
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Expanded(
                                  child: Text(
                                    "عرض الإسناد",
                                    style: GoogleFonts.scheherazadeNew(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),

                                Icon(
                                  Icons.schema,
                                  size: 20,
                                  color: AppColor.grey3,
                                ),
                              ],
                            ),
                          ),
                        ],
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, size: 18, color: AppColor.grey),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$hadithCount حديث",
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 16,
                      color: AppColor.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10),

                  Icon(
                    Icons.calendar_month_outlined,
                    size: 18,
                    color: AppColor.grey,
                  ),

                  SizedBox(width: 6),

                  Text(
                    deathYear,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 16,
                      color: AppColor.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: []),
              Row(
                children: [
                  Text(
                    description,
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grey,
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isDark
                                  ? AppColor.primary.withOpacity(.60)
                                  : Colors.greenAccent.withOpacity(0.40),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          status2,
                          style: GoogleFonts.scheherazadeNew(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color:
                                isDark ? AppColor.primary3 : AppColor.primary5,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: getBgColor(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          status1,
                          style: GoogleFonts.scheherazadeNew(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: getTextColor(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
