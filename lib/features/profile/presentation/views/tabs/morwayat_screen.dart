import 'package:asaneed/core/route/routes.dart';
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

class _MorwayatScreenState extends State<MorwayatScreen> {
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
          padding: const EdgeInsets.only(right: 28),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("المرويات",style: GoogleFonts.roboto(fontSize: 22,fontWeight: FontWeight.w900,
                    color: AppColor.getBlack(context)),),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.pushNamed(context, PageRouteName.hadethScreen);
                  },
                  child: Container(
                    width: 360,
                    height: 150,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.getContainerColor(context),
                      borderRadius: BorderRadius.circular(16),
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
                                      size: 20,
                                    ),
                                    const SizedBox(width: 16),

                                    Icon(
                                      Icons.copy,
                                      color: isDark ? Colors.white : AppColor.black,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 16),

                                    Icon(
                                      Icons.favorite_border,
                                      color: isDark ? Colors.white : AppColor.black,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 16),

                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentText = (currentText == hadithWithTashkeel)
                                              ? hadithWithoutTashkeel
                                              : hadithWithTashkeel;
                                        });
                                      },
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor.green2,
                                    border: Border.all(
                                      color: AppColor.green,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "صحيح",
                                    style: const TextStyle(
                                      color: AppColor.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("صحيح مسلم", style: AppColor.textgrey),
                                const SizedBox(width: 5),
                                const Icon(Icons.menu_book_outlined, color: AppColor.primary, size: 20),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Text(
                          currentText,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.pushNamed(context, PageRouteName.hadethScreen);
                  },
                  child: Container(
                    width: 360,
                    height: 150,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.getContainerColor(context),
                      borderRadius: BorderRadius.circular(16),
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
                                      size: 20,
                                    ),
                                    const SizedBox(width: 16),

                                    Icon(
                                      Icons.copy,
                                      color: isDark ? Colors.white : AppColor.black,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 16),

                                    Icon(
                                      Icons.favorite_border,
                                      color: isDark ? Colors.white : AppColor.black,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 16),

                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentText = (currentText == hadithWithTashkeel)
                                              ? hadithWithoutTashkeel
                                              : hadithWithTashkeel;
                                        });
                                      },
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor.green2,
                                    border: Border.all(
                                      color: AppColor.green,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "صحيح",
                                    style: const TextStyle(
                                      color: AppColor.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 4),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("صحيح مسلم", style: AppColor.textgrey),
                                const SizedBox(width: 5),
                                const Icon(Icons.menu_book_outlined, color: AppColor.primary, size: 20),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Text(
                          currentText,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
