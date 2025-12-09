import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/AppThemeManager.dart';
import '../../../../theme/app_theme.dart';

class Hadethscreen extends StatefulWidget {
  const Hadethscreen({super.key});

  @override
  State<Hadethscreen> createState() => _HadethscreenState();
}

class _HadethscreenState extends State<Hadethscreen> {
  String hadithWithTashkeel =
      "مَنْ أَحَقُّ النَّاسِ بِحُسْنِ صَحَابَتِي؟ قَالَ: أُمُّكَ...";

  String hadithWithoutTashkeel =
      "من احق الناس بحسن صحابتي؟ قال: امك...";

  String currentText = "";   // النص اللي هيظهر

  @override
  void initState() {
    super.initState();
    currentText = hadithWithTashkeel;   // بداية يظهر بالتشكيل
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;
    return Scaffold(
      backgroundColor:isDark?
      Color(0xFF111814)
          :AppColor.white,

      appBar: AppBar(
        backgroundColor:isDark?
        AppColor.black
            :AppColor.white,
        elevation: 0,
        centerTitle: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "الأحاديث",
            style: TextStyle(
              color:  isDark?
            AppColor.white
                : AppColor.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color:  isDark?
          AppColor.white
              : AppColor.black,),
          onPressed: () => Navigator.pop(context),
        ),
      ),


        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: height * 0.015),

              // الكارد كامل
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
                                    width: width * 0.055,        // نفس size بتاع Icon
                                    height: width * 0.055,       // مهم جداً
                                    child: Image.asset(
                                      "assets/images/png/textIcon.png",
                                      color: isDark ? AppColor.white : AppColor.black,
                                      fit: BoxFit.contain,       // عشان ما تتمددش وتبوظ
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
              SizedBox(height: height * 0.02),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              _tag("#Brotherhood"),
              _tag("#Iman"),
            ],
          )



            ],
          ),
                ),
        );

  }
  Widget _tag(String text) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.transparent, // خلفية شفافة
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.grey.withOpacity(0.2), // بوردر خفيف (ممكن تلغيه)
          width: 1,
        ),
      ),
      child: Text(
        text,
        style:  TextStyle(
          color:isDark?AppColor.grey : AppColor.black, // لون النص أسود
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

}
