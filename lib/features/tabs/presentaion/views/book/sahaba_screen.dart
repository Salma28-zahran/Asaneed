import 'package:asaneed/features/tabs/presentaion/views/book/widgets/sahaba_card.dart';
import 'package:asaneed/features/tabs/presentaion/views/book/widgets/sahaba_filter_bottom_sheet.dart';
import 'package:asaneed/features/tabs/presentaion/views/hadith/presentation/widgets/hadith_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../../../theme/AppThemeManager.dart';
import '../../../../../../../theme/app_theme.dart';
import '../hadith/presentation/widgets/hadith_filter_bottom_sheet.dart';

class SahabaScreen extends StatefulWidget {
  const SahabaScreen({super.key});

  @override
  State<SahabaScreen> createState() => _SahabaScreenState();
}

class _SahabaScreenState extends State<SahabaScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    final List<Map<String, dynamic>> persons = [
      {
        "name": "جابر بن عبد الله الأنصاري",
        "description": "من كبار رواة الحديث",
        "hadithCount": 1540,
        "deathYear": "توفي 78 هـ",
        "status1": "صحابي",
        "status2": "ثقة",
      },
      {
        "name": "علي بن أبي طالب",
        "description": "رابع الخلفاء الراشدين",
        "hadithCount": 586,
        "deathYear": "توفي 40 هـ",
        "status1": "صحابي",
        "status2": "ثقة",
      },
      {
        "name": "الحسن البصري",
        "description": "من كبار التابعين",
        "hadithCount": 300,
        "deathYear": "توفي 110 هـ",
        "status1": "تابعي",
        "status2": "ثقة",
      },{
        "name": "النعمان بن بشير",
        "description": "صحابي صغير راوي احاديث مهمه",
        "hadithCount": 0,
        "deathYear": "توفي 65 هـ",
        "status1": "تابعي",
        "status2": "ثقة",
      },
      {
        "name": "سفيان الثوري",
        "description": "محدث وفقيه كبير",
        "hadithCount": 0,
        "deathYear": "توفي 161 هـ",
        "status1": "تابع التابعي",
        "status2": "ثقة",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        backgroundColor: AppColor.getAppBarColor(context),
        elevation: 0,
        centerTitle: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "الصحابة",
            style: GoogleFonts.scheherazadeNew(
              color: isDark ? AppColor.white : AppColor.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //search
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.getContainerColor(context),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColor.border,width: 1.5),
                      ),
                      child: TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: "ابحث عن حديث...",
                          hintStyle: GoogleFonts.scheherazadeNew(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppColor.grey,
                          ),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 25,
                            color: AppColor.grey,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),

                  //filter
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColor.getContainerColor(context),
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (context) {
                          return SahabaFilterBottomSheet();
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.getContainerColor(context),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColor.border,width: 1.5),
                      ),
                      child: Icon(
                        Icons.tune,
                        size: 20,
                        color: isDark ? AppColor.white : AppColor.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Text(
                persons.length.toString(),
                style: TextStyle(color: AppColor.grey,fontSize: 16),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child:  SahabaCard(
                    name: persons[index]["name"],
                      description: persons[index]["description"],
                      hadithCount: persons[index]["hadithCount"],
                      deathYear: persons[index]["deathYear"],
                      status1: persons[index]["status1"],
                      status2: persons[index]["status2"],
                    ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
