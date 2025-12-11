import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/app_theme.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          context.watch<AppThemeManager>().isDarkMode
              ? Color(0xFF111814)
              : Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColor.getAppBarColor(context),
        title: Text(
          "المزيد عن أسانيد",
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "كل ما تحتاجه لفهم الأحاديث النبوية والرواة والصحابة — في تطبيق واحد.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                ),
              ),

              const SizedBox(height: 15),
              Text(
                "أسانيد هو التطبيق الذي يساعد المستخدمين على استكشاف الأحاديث النبوية الشريفة، والتعرف على الصحابة والرواة الذين نقلوا هذه الأحاديث عن رسول الله ﷺ، بأسلوب منظم وسهل الفهم.\n"
                "في عالم تتسارع فيه التكنولوجيا، حان الوقت للاستفادة منها في خدمة العلم الشرعي. \"أسانيد\" يستخدم أحدث التقنيات لتقديم تجربة تعليمية سلسة، تركز على الفهم والتأمل بدلًا من التعقيد والتكرار.\n"
                "ما يميزنا هو أننا نريد تحويل رحلة التعلم إلى تجربة ممتعة ومثيرة.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.getBlack(context),
                  fontSize: 16,
                  height: 1.8,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),
              Text(
                "الإصدار 1.0",
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
