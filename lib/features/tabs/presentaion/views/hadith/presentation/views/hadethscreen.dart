import 'package:asaneed/features/tabs/presentaion/views/hadith/presentation/widgets/hadith_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../../../theme/AppThemeManager.dart';
import '../../../../../../../theme/app_theme.dart';
import '../../../../../../details/presentation/views/tabs/rwah2/widgets/hadith_card.dart';

class Hadethscreen extends StatefulWidget {
  const Hadethscreen({super.key});

  @override
  State<Hadethscreen> createState() => _HadethscreenState();
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
class _HadethscreenState extends State<Hadethscreen> {
  String hadithWithTashkeel =
      "مَنْ أَحَقُّ النَّاسِ بِحُسْنِ صَحَابَتِي؟ قَالَ: أُمُّكَ...";

  String hadithWithoutTashkeel = "من احق الناس بحسن صحابتي؟ قال: امك...";

  String currentText = "";
  String selectedStatus = "كل الدرجات";

  @override
  void initState() {
    super.initState();
    currentText = hadithWithTashkeel;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    List<Hadith> allHadith = [
      Hadith(
        number: 1,
        text: "إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى.",
        status: "صحيح",
      ),
      Hadith(
        number: 2,
        text: "بني الإسلام على خمس: شهادة أن لا إله إلا الله...",
        status: "حسن",
      ),
      Hadith(
        number: 3,
        text: "لا يؤمن أحدكم حتى يحب لأخيه ما يحب لنفسه.",
        status: "صحيح",
      ),
    ];
    List<Hadith> filteredHadith;

    if (selectedStatus == "كل الدرجات") {
      filteredHadith = allHadith;
    } else {
      filteredHadith =
          allHadith.where((h) => h.status == selectedStatus).toList();
    }
    return Scaffold(
      backgroundColor: isDark ? Color(0xFF111814) : AppColor.white,

      appBar: AppBar(
        backgroundColor: isDark ? AppColor.black : Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "الأحاديث",
            style: GoogleFonts.scheherazadeNew(
              color: isDark ? AppColor.white : AppColor.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColor.grey3),
          onPressed: () => Navigator.pop(context),
        ),
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
                        border: Border.all(color: Color(0xffbfb8ae)),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColor.getContainerColor(context),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xffbfb8ae)),
                    ),
                    child: Icon(
                      Icons.tune,
                      size: 20,
                      color: isDark ? AppColor.white : AppColor.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  //essnad
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: isDark ? AppColor.primary : Color(0xffe8f2ed),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      Icons.account_tree_outlined,
                      size: 20,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),
              Text(
                filteredHadith.length.toString(),
                style: TextStyle(color: AppColor.grey3,fontSize: 16),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  filterChip(
                    "كل الدرجات",
                    isDark ? Color(0xFF1F3A33) : Color(0xFFE8F3ED),
                    isDark ? Color(0xFF6ED4A7) : Color(0xFF2E6B55),
                  ),
                  SizedBox(width: 8),
                  filterChip(
                    "صحيح",
                    isDark ? Color(0xFF133B22) : Color(0xFFDFF3E6),
                    isDark ? Color(0xFF4ADE80) : Color(0xFF2E7D32),
                  ),
                  SizedBox(width: 8),
                  filterChip(
                    "حسن",
                    isDark ? Color(0xFF3B3312) : Color(0xFFF5EFCB),
                    isDark ? Color(0xFFFACC15) : Color(0xFF8D7B2E),
                  ),
                  SizedBox(width: 8),
                  filterChip(
                    "ضعيف",
                    isDark ? Color(0xFF3B1C1C) : Color(0xFFF4D7D5),
                    isDark ? Color(0xFFF87171) : Color(0xFF9E3B3B),
                  ),
                ],
              ),

              SizedBox(height: 20),
              /// List
              Expanded(
                child: filteredHadith.isEmpty
                    ? _emptyState()
                    : ListView.builder(
                  itemCount: filteredHadith.length,
                  itemBuilder: (context, index) {
                    final hadith = filteredHadith[index];

                    return Padding(
                      padding:  EdgeInsets.only(bottom: 10),
                      child: HadithCard2(
                        number: hadith.number,
                        text: hadith.text,
                        status: hadith.status,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Filter Chip
  Widget filterChip(
      String text,
      Color bgColor,
      Color textColor,
      ) {
    final isSelected = selectedStatus == text;
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        setState(() {
          selectedStatus = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (isDark ? Color(0xFF6ED4A7) : AppColor.black)
                : Colors.grey.shade300,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.scheherazadeNew(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
  ///if body is empty
  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xff1F3A32) // Dark background
                  : Color(0xffE5ECE8), // Light background
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.search_off,
              size: 40,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xff8FB7A7) // Dark icon
                  : Color(0xff3A6B57), // Light icon
            ),
          ),

          SizedBox(height: 20),

          Text(
            "لا توجد أحاديث",
            style: GoogleFonts.scheherazadeNew(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColor.getBlack(context)
            ),
          ),

          SizedBox(height: 8),

          Text(
            "جرب كلمات بحث أو فلاتر مختلفة.",
            style: GoogleFonts.scheherazadeNew(
              fontSize: 16,
              color: AppColor.grey,
              fontWeight: FontWeight.w400
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedStatus = "كل الدرجات";
              });
            },
            child: Text(
              "إعادة ضبط",
              style: GoogleFonts.scheherazadeNew(fontSize: 20,color: AppColor.white,fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
