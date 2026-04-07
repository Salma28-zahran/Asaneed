import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/tabs/presentaion/views/hadith/presentation/widgets/hadith_card.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MorwayatScreen extends StatefulWidget {
  const MorwayatScreen({super.key});

  @override
  State<MorwayatScreen> createState() => _MorwayatScreenState();
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

class _MorwayatScreenState extends State<MorwayatScreen> {
  final featuredHadith = Hadith(
    number: 1,
    text: "إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى.",
    status: "صحيح",
  );
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
     final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;
    return Scaffold(
        backgroundColor:
        isDark ? const Color(0xFF111814) : const Color(0xFFF9F7F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 28,left: 17),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("احاديثه",style: GoogleFonts.tajawal(fontSize: 22,fontWeight: FontWeight.w500,
                    color: AppColor.getBlack(context)),),
                SizedBox(height: 10,),
                HadithCard2(
                  number: featuredHadith.number,
                  text: featuredHadith.text,
                  status: featuredHadith.status,
                ),
                SizedBox(height: 16,),
                HadithCard2(
                  number: featuredHadith.number,
                  text: featuredHadith.text,
                  status: featuredHadith.status,
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
