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
      backgroundColor: isDark ? Colors.grey[900] : Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColor.getAppBarColor(context),
        elevation: 0,
        centerTitle: false,
        title: Text(
          "سياسة الخصوصية & شروط الاستخدام",
          style: GoogleFonts.cairo(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColor.getBlack(context),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.getBlack(context),
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: AppColor.getBlack(context),
                    fontSize: 15,
                    height: 1.8,
                    fontFamily: GoogleFonts.cairo().fontFamily,
                  ),
                  children: [
                    const TextSpan(
                      text:
                      "سياسة الخصوصية لتطبيق \"أسانيد\"\n\n"
                          "1. المقدمة\n"
                          "مرحبًا بك في سياسة الخصوصية الخاصة بتطبيق \"أسانيد\" (\"نحن\"، \"لنا\"، أو \"التطبيق\"). تهدف هذه السياسة إلى توضيح كيفية تعاملنا مع البيانات الشخصية التي قد نجمعها، وكيفية استخدامها وحمايتها، بالإضافة إلى حقوقك وخياراتك المتعلقة بهذه البيانات.\n\n"
                          "2. البيانات التي نجمعها\n\n"
                          "2.1 البيانات الشخصية\n"
                          "لا يتطلب تطبيق \"أسانيد\" أي بيانات شخصية لاستخدامه في تصفح الأحاديث والرواة والصحابة. ومع ذلك، في حال قررت إنشاء حساب داخل التطبيق، فقد نقوم بجمع البيانات التالية فقط:\n"
                          "• البريد الإلكتروني\n\n"
                          "2.2 ملفات تعريف الارتباط وتقنيات التتبع\n"
                          "لا يستخدم تطبيق \"أسانيد\" ملفات تعريف الارتباط أو تقنيات التتبع في الوقت الحالي، نظرًا لطبيعة المحتوى الديني والتعليمي الذي يقدمه، وعدم الحاجة إلى تخصيص أو تحليل سلوك المستخدم.\n\n"
                          "3. كيفية استخدام البيانات\n"
                          "نستخدم البريد الإلكتروني الذي يتم إدخاله عند إنشاء الحساب للأغراض التالية فقط:\n"
                          "• إرسال الإشعارات المتعلقة بالتحديثات الجديدة في التطبيق\n"
                          "• إعلام المستخدم بأي تغييرات أو إضافات في المحتوى أو الوظائف\n\n"
                          "4. مشاركة البيانات مع أطراف ثالثة\n"
                          "نحن لا نشارك بياناتك الشخصية مع أي طرف ثالث، إلا في الحالات التالية:\n"
                          "• الامتثال القانوني: إذا طُلب منا ذلك بموجب القانون أو لحماية حقوقنا.\n"
                          "• بموافقتك الصريحة: إذا وافقت على مشاركة بياناتك لغرض معين.\n\n"
                          "5. حقوقك وخياراتك\n\n"
                          "5.1 إلغاء الاشتراك\n"
                          "يمكنك إلغاء الاشتراك في تلقي الإشعارات أو الرسائل عبر البريد الإلكتروني في أي وقت من خلال إعدادات الحساب داخل التطبيق أو عبر التواصل معنا مباشرة.\n\n"
                          "5.2 الوصول والتعديل\n"
                          "يحق لك الوصول إلى بياناتك الشخصية وتعديلها. إذا رغبت في ذلك، يرجى التواصل معنا عبر البريد الإلكتروني الموضح أدناه.\n"
                          "5.3 حذف البيانات\n"
                          "يمكنك طلب حذف بياناتك الشخصية في أي وقت، ما لم يكن هناك التزام قانوني أو سبب مشروع للاحتفاظ بها.\n\n"
                          "6. أمن البيانات\n"
                          "نلتزم بتطبيق إجراءات أمنية مناسبة لحماية بياناتك الشخصية من الوصول غير المصرح به أو التعديل أو الإتلاف.\n\n"
                          "7. التعديلات على سياسة الخصوصية\n"
                          "نحتفظ بحق تعديل هذه السياسة بما يتوافق مع أي تغييرات في التطبيق أو في الممارسات القانونية. سيتم نشر أي تحديثات على هذه الصفحة وتصبح سارية فور نشرها.\n\n"
                          "8. التواصل معنا\n"
                          "إذا كان لديك أي استفسارات أو ملاحظات حول سياسة الخصوصية، يرجى التواصل معنا عبر البريد الإلكتروني:\n\n",
                    ),
                    TextSpan(
                      text: "support@assaned.app",
                      style: TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
