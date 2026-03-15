import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/route/routes.dart';

class HadithCard2 extends StatelessWidget {
  final int number;
  final String text;
  final String status;

  const HadithCard2({
    super.key,
    required this.number,
    required this.text,
    required this.status,
  });

  Color _statusColor() {
    switch (status) {
      case "صحيح":
        return Colors.green;
      case "حسن":
        return Colors.amber;
      case "ضعيف":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            PageRouteName.hadithDetails,
            arguments: {
              "number": number,
              "status": status,
            },
          );        },
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
                    "# $number • علوم الحديث الموقوف والمقطوع",
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 16,
                      color: AppColor.grey,
                      fontWeight: FontWeight.w500,
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
                                    "حفظ الحديث",
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
                                    "نسخ النص",
                                    style: GoogleFonts.scheherazadeNew(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Icon(
                                  Icons.copy_outlined,
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
                                    "مشاركة",
                                    style: GoogleFonts.scheherazadeNew(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),

                                Icon(
                                  Icons.share_outlined,
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
                children: [
                  Expanded(
                    child: Text(
                      text,
                      textAlign: TextAlign.right,
                      style: AppColor.textBlack(context).copyWith(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: _statusColor().withOpacity(.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: GoogleFonts.scheherazadeNew(
                        color: _statusColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
