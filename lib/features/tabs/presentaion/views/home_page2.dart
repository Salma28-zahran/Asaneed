import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/PersonCard.dart';

class HomePage2 extends StatefulWidget {
  final void Function(int)? onTabChange;

  const HomePage2({super.key, this.onTabChange});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;

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
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: " ...ابحث في الأحاديث أو الرواة",
                    hintStyle: GoogleFonts.inter(
                      color: Color(0xFF6B7280),
                      fontSize: width * 0.04,
                    ),
                    contentPadding: EdgeInsets.only(
                        right: width * 0.015, left: width * 0.03),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: width * 0.025),
                      child: Icon(
                        Icons.search,
                        color: Color(0xFF6A6A80),
                        size: width * 0.055,
                      ),
                    ),
                    suffixIconConstraints:
                    BoxConstraints(minWidth: width * 0.08),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.012),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (widget.onTabChange != null) {
                      widget.onTabChange!(2);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back,
                          color: AppColor.primary, size: width * 0.04),
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
                Text(
                  "حديث اليوم",
                  style: AppColor.textBlack(context),
                ),
              ],
            ),
            SizedBox(height: height * 0.018),
            Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.005, horizontal: width * 0.03),
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
                      Row(
                        children: [
                          Text(
                            "صحيح مسلم",
                            style: AppColor.textgrey,
                          ),
                          SizedBox(width: width * 0.015),
                          Icon(Icons.menu_book_outlined,
                              color: AppColor.primary, size: width * 0.045),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.015),
                  Text(
                    "مَنْ أَحَقُّ النَّاسِ بِحُسْنِ صَحَابَتِي؟ قَالَ: أُمُّكَ...",
                    textDirection: TextDirection.rtl,
                    style: AppColor.ahades(context),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.012),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "رواة شوهدوا مؤخراً",
                style: AppColor.textBlack(context)
                    .copyWith(fontSize: width * 0.045),
              ),
            ),
            PersonCard(
              name: "علي بن أبي طالب",
              badgeText: "صحابي",
              badgeColor: AppColor.green,
              deathYear: 40,
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.details);
              },
            ),
            PersonCard(
              name: "مجاهد بن جبر",
              badgeText: "تابعي",
              badgeColor: AppColor.blue,
              deathYear: 104,
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.details);
              },
            ),
            PersonCard(
              name: "عكرمة",
              badgeText: "تابعي",
              badgeColor: AppColor.blue,
              deathYear: 105,
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.details);
              },
            ),
            PersonCard(
              name: "أبو داود",
              badgeText: "تابع التابعين",
              badgeColor: AppColor.orange2,
              deathYear: 275,
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.details);
              },
            ),
          ],
        ),
      ),
    );
  }
}
