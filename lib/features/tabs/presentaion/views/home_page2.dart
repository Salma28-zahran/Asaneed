import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/tabs/presentaion/widgets/ItemRow.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../theme/AppThemeManager.dart';
import '../widgets/PersonCard.dart';

class HomePage2 extends StatefulWidget {
  final void Function(int)? onTabChange;

  const HomePage2({super.key, this.onTabChange});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  String hadithWithTashkeel =
      "مَنْ أَحَقُّ النَّاسِ بِحُسْنِ صَحَابَتِي؟ قَالَ: أُمُّكَ...";

  String hadithWithoutTashkeel =
      "من احق الناس بحسن صحابتي؟ قال: امك...";

  String currentText = "";

  @override
  void initState() {
    super.initState();
    currentText = hadithWithTashkeel;
  }
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.025),

            Center(
              child: Container(
                height: height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.getContainerColor(context),
                  borderRadius: BorderRadius.circular(width * 0.075),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: " ...ابحث في الأحاديث أو الرواة",
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xFF6B7280),
                      fontSize: width * 0.04,
                    ),
                    contentPadding: EdgeInsets.only(
                      right: width * 0.015,
                      left: width * 0.03,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: width * 0.025),
                      child: Icon(
                        Icons.search,
                        color: const Color(0xFF6A6A80),
                        size: width * 0.055,
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: width * 0.08,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.012),

            /// المزيد
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    widget.onTabChange?.call(2);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: AppColor.primary,
                        size: width * 0.04,
                      ),
                      SizedBox(width: width * 0.012),
                      Text(
                        "المزيد ",
                        style: AppColor.textprimary.copyWith(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.013),

            Align(
              alignment: Alignment.topRight,
              child: Text("عرض الاسانيد", style: AppColor.textBlack(context)),
            ),

            SizedBox(height: height * 0.018),

            Container(
              width: width * 0.97,
              padding: EdgeInsets.all(width * 0.02),
              decoration: BoxDecoration(
                color: AppColor.getContainerColor(context),
                borderRadius: BorderRadius.circular(width * 0.04),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ItemRow(
                    icon: Icons.circle,
                    title: 'الدائرة الإسنادية',
                    description: 'استعرض الأسانيد في دائرة واحدة.',
                    iconBackground: const Color(0xFFE3F2E3),
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.circle1);
                    },
                  ),

                  const SizedBox(height: 12),

                  ItemRow(
                    icon: Icons.account_tree_outlined,
                    title: 'شجرة الإسنادية',
                    description: 'اطلع على تسلسل الإسناد من الصحابي للراوي.',
                    iconBackground: const Color(0xFFFFF4E5),
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.tree);
                    },
                  ),

                  const SizedBox(height: 12),

                  ItemRow(
                    icon: Icons.credit_card_rounded,
                    title: 'البطاقات الإسنادية',
                    description: 'عرض معلومات كل راوٍ بطريقة مختصرة.',
                    iconBackground: const Color(0xFFE7E9FF),
                    onTap: () {
                      widget.onTabChange?.call(1);
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.018),

            /// حديث اليوم
            Align(
              alignment: Alignment.topRight,
              child: Text("حديث اليوم", style: AppColor.textBlack(context)),
            ),
            SizedBox(height: height * 0.018),

          InkWell(
            borderRadius: BorderRadius.circular(width * 0.04),
            onTap: () {
              Navigator.pushNamed(context, PageRouteName.hadethScreen);
            },
            child: Container(
              width: width * 0.97,
              height: height * 0.17,
              padding: EdgeInsets.all(width * 0.035),
              decoration: BoxDecoration(
                color: AppColor.getContainerColor(context),
                borderRadius: BorderRadius.circular(width * 0.04),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                      Row(
                      children: [
                      Icon(
                      Icons.share_outlined,
                        color: isDark ? Colors.white : AppColor.black,
                        size: width * 0.055,
                      ),
                      SizedBox(width: width * 0.045),

                      Icon(
                        Icons.copy,
                        color: isDark ? Colors.white : AppColor.black,
                        size: width * 0.055,
                      ),
                      SizedBox(width: width * 0.045),

                      Icon(
                        Icons.favorite_border,
                        color: isDark ? Colors.white : AppColor.black,
                        size: width * 0.055,
                      ),
                      SizedBox(width: width * 0.045),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentText = (currentText == hadithWithTashkeel)
                                  ? hadithWithoutTashkeel
                                  : hadithWithTashkeel;
                            });
                          },
                          child: SizedBox(
                            width: width * 0.055,
                            height: width * 0.055,
                            child: Image.asset(
                              "assets/images/png/textIcon.png",
                              color: isDark ? AppColor.white : AppColor.black,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                    ],
              ),


              Container(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.005,
                              horizontal: width * 0.03,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.green2,
                              border: Border.all(
                                color: AppColor.green,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(width * 0.1),
                            ),
                            child: Text(
                              "صحيح",
                              style: TextStyle(
                                color: AppColor.green,
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.006),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("صحيح مسلم", style: AppColor.textgrey),
                          SizedBox(width: width * 0.015),
                          Icon(Icons.menu_book_outlined, color: AppColor.primary, size: width * 0.045),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.015),

                  Text(
                    currentText,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 20 ),

                  )
                ],
              ),
            ),
          ),


          SizedBox(height: height * 0.018),

            /// رواة شوهدوا مؤخراً
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "رواة شوهدوا مؤخراً",
                style: AppColor.textBlack(
                  context,
                ).copyWith(fontSize: width * 0.045),
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

            PersonCard(
              name: "مجاهد بن جبر",
              badgeText: "تابعي",
              badgeColor: AppColor.blue,
              deathYear: 104,
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.profile);
              },
            ),

            PersonCard(
              name: "عكرمة",
              badgeText: "تابعي",
              badgeColor: AppColor.blue,
              deathYear: 105,
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.profile);
              },
            ),

            PersonCard(
              name: "أبو داود",
              badgeText: "تابع التابعين",
              badgeColor: AppColor.orange2,
              deathYear: 275,
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.profile);
              },
            ),
          ],
        ),
      ),
    );
  }
}
