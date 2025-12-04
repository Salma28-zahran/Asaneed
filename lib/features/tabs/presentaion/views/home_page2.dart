import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage2 extends StatefulWidget {
  final void Function(int)? onTabChange;

  const HomePage2({super.key, this.onTabChange});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          SizedBox(height: 20),

          Center(
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(30),
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
                    fontSize: 16,
                  ),
                  contentPadding: const EdgeInsets.only(right: 6, left: 12),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF6A6A80),
                      size: 22,
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(minWidth: 35),
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

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
                    Icon(Icons.arrow_back, color: AppColor.primary, size: 16),
                    SizedBox(width: 5),
                    Text(
                      "المزيد ",
                      style: AppColor.textprimary.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Text("حديث اليوم", style: AppColor.textblack),
            ],
          ),

          SizedBox(height: 14),

          Container(
            width: 405,
            height: 132,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
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
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColor.green2,
                        border: Border.all(
                          color: AppColor.green,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Text(
                        "صحيح",
                        style: TextStyle(
                          color: AppColor.green,
                          fontSize: 14,
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
                        SizedBox(width: 6),
                        Icon(Icons.menu_book_outlined,
                            color: AppColor.primary, size: 18),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 12),

                Text(
                  "مَنْ أَحَقُّ النَّاسِ بِحُسْنِ صَحَابَتِي؟ قَالَ: أُمُّكَ...",
                  textDirection: TextDirection.rtl,
                  style: AppColor.ahades
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
