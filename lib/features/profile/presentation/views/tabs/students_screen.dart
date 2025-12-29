import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../tabs/presentaion/widgets/PersonCard.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;
    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF111814) : const Color(0xFFF9F7F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 28),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("تلاميذه",style: GoogleFonts.roboto(fontSize: 22,fontWeight: FontWeight.w900,
                    color: AppColor.getBlack(context)),),
                PersonCard(
                  name: "علي بن أبي طالب",
                  badgeText: "صحابي",
                  badgeColor: AppColor.green,
                  deathYear: 40,
                  onTap: () {

                  },
                ),
        
                PersonCard(
                  name: "مجاهد بن جبر",
                  badgeText: "تابعي",
                  badgeColor: AppColor.blue,
                  deathYear: 104,
                  onTap: () {

                  },
                ),
        
                PersonCard(
                  name: "عكرمة",
                  badgeText: "تابعي",
                  badgeColor: AppColor.blue,
                  deathYear: 105,
                  onTap: () {

                  },
                ),
        
                PersonCard(
                  name: "أبو داود",
                  badgeText: "تابع التابعين",
                  badgeColor: AppColor.orange2,
                  deathYear: 275,
                  onTap: () {

                  },
                ),
        
              ],
        
            ),
          ),
        ),
      ),

    );
  }
}
