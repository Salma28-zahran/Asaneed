import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/tabs/presentaion/views/hadith/presentation/widgets/hadith_card.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/ItemRow.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/home/StatsSection.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/home/WelcomeBanner.dart';

import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../theme/AppThemeManager.dart';
import '../widgets/PersonCard.dart';

class HomePage2 extends StatefulWidget {
  final void Function(int)? onTabChange;

  const HomePage2({super.key, this.onTabChange});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class Hadith {
  final int number;
  final String text;
  final String status;

  Hadith({
    required this.number,
    required this.text,
    required this.status,
  });
}

class _HomePage2State extends State<HomePage2> {
  // الحديث الذي سيظهر في الصفحة الرئيسية
  final featuredHadith = Hadith(
    number: 1,
    text: "إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى.",
    status: "صحيح",
  );

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.020),

              /// Welcome Banner
              const WelcomeBanner(),

              SizedBox(height: height * 0.020),

              /// Stats Section
              const StatsSection(),

              SizedBox(height: 24),

              /// **Featured Hadith Card**
               Align(
                        alignment: Alignment.topRight,
                         child: Text("حديث اليوم", style: AppColor.textBlack(context)),
                      ),
              SizedBox(height: 14),
              HadithCard2(
                number: featuredHadith.number,
                text: featuredHadith.text,
                status: featuredHadith.status,
              ),

              SizedBox(height: height * 0.018),

              /// Quick Actions
              Row(
                children: [
                  Expanded(
                    child: ActionButton(
                      title: "بحث",
                      icon: Icons.search,
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.search);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: ActionButton(
                      title: "رواة",
                      icon: Icons.people_outline,
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.rawah);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: ActionButton(
                      title: "أحاديث",
                      icon: Icons.menu_book_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, PageRouteName.hadethScreen);
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "رواة شوهدوا مؤخراً",
                  style: AppColor.textBlack(context)
                      .copyWith(fontSize: width * 0.045),
                ),
              ),

              SizedBox(height: height * 0.012),

              PersonCard(
                name: "علي بن أبي طالب",
                badgeText: "صحابي",
                badgeColor: AppColor.green,
                deathYear: 40,
                onTap: () {
                  Navigator.pushNamed(context, PageRouteName.profile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColor.getContainerColor(context),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColor.getborder(context), width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "Cairo",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff2F5D50),
              ),
            ),
            const SizedBox(width: 8),
            Icon(icon, color: const Color(0xff2F5D50), size: 20),
          ],
        ),
      ),
    );
  }
}