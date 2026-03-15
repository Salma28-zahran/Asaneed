import 'package:asaneed/features/tabs/presentaion/views/Account/widgets/custom_app_bar_account.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeManager>().isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? Color(0xFF111814) : Colors.transparent,
      appBar: CustomAppBarAccount(title: "الشروط و الاحكام "),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child:  SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFdbeafe),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1.5, color: AppColor.border),
              ),
              child: Text(
                "أسانيد نموذج أولي غير إنتاجي لأغراض تعليمية وبحثية. يرجى قراءة هذه الشروط قبل استخدام التطبيق.\nآخر تحديث: فبراير ٢٠٢٦",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: GoogleFonts.scheherazadeNew(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColor.grey2,
                ),
              ),
            ),

            SizedBox(height: 20),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle("١. قبول الشروط",context),
                  buildSectionBody(
                      "باستخدامك لتطبيق أسانيد، فأنت توافق على الالتزام بهذه الشروط والأحكام. "
                          "أسانيد نموذج أولي للواجهة الأمامية فقط مقدم لأغراض تجريبية وتعليمية."),

                  SizedBox(height: 16),

                  buildSectionTitle("٢. إخلاء مسؤولية النموذج الأولي",context),
                  buildSectionBody(
                      "أسانيد نموذج أولي غير إنتاجي. جميع المحتوى — بما في ذلك نصوص الأحاديث "
                          "ومعلومات الرواة وبيانات الأسانيد — بيانات تجريبية اصطناعية لا تمثل "
                          "مصادر علمية موثوقة. لا تعتمد عليها لأغراض دينية أو قانونية أو أكاديمية."),

                  SizedBox(height: 16),

                  buildSectionTitle("٣. عدم جمع البيانات",context),
                  buildSectionBody(
                      "لا يجمع أسانيد أي بيانات شخصية ولا يرسلها إلى خوادم خارجية. "
                          "جميع البيانات تُخزن محليًا باستخدام localStorage ولا تغادر جهازك."),

                  SizedBox(height: 16),

                  buildSectionTitle("٤. الملكية الفكرية",context),
                  buildSectionBody(
                      "تصميم نظام أسانيد وواجهة المستخدم وكود النموذج الأولي "
                          "هي ملكية فكرية لأصحابها. النصوص الإسلامية الكلاسيكية "
                          "جزء من التراث الإسلامي المتاح للعموم."),

                  SizedBox(height: 16),

                  buildSectionTitle("٥. تحديد المسؤولية",context),
                  buildSectionBody(
                      "يُقدم أسانيد \"كما هو\" دون ضمانات. لن يكون المطورون مسؤولين "
                          "عن أي أضرار ناتجة عن استخدام النموذج أو عدم القدرة على استخدامه."),
                  SizedBox(height: 16),
                  buildSectionTitle("٦. المبادئ الحاكمة",context),
                  buildSectionBody(
                    "بُني أسانيد باحترام للعلم الإسلامي وتقاليد علم الحديث. يهدف النموذج الأولي إلى جعل هذه التخصصات في متناول الجميع من خلال تجربة مستخدم حديثة، مع الإقرار بأن الخبرة العلمية العميقة تبقى مع العلماء المتخصصين."
                    ),
                  SizedBox(height: 16),
                  Divider(thickness: 3,color: AppColor.border,),
                  SizedBox(height: 16),

                ],
              ),
            ),

          ],
        ),
      ),
        ),
      ),
    );
  }
  Widget buildSectionTitle(String title,BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.right,
      style: GoogleFonts.scheherazadeNew(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColor.getBlack(context)
      ),
    );
  }

  Widget buildSectionBody(String body,) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        body,
        textAlign: TextAlign.right,
        style: GoogleFonts.scheherazadeNew(
          fontSize: 16,
          height: 1.6,
          color: AppColor.grey3,
        ),
      ),
    );
  }
}
