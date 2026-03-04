import 'package:asaneed/features/tabs/presentaion/views/profile/widgets/custom_app_bar_account.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeManager>().isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? Color(0xFF111814) : Colors.transparent,
      appBar: CustomAppBarAccount(title: "سياسة الخصوصية"),

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // أيقونة القفل
                      Container(
                        width: 48,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(Icons.lock_outline, color: Colors.white),
                      ),
                      SizedBox(width: 12),

                      // النص
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "نموذج تقديم الخصوصية أولاً",
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F3B2E),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "أسناد يخزن جميع البيانات محليًا على جهازك. لا تُرسل أي بيانات إلى خادم.",
                              style: GoogleFonts.ibmPlexSans(
                                fontSize: 16,
                                color: Color(0xFF3E5F52),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFF2C3630) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1.5, color: AppColor.border),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Row(
                          textDirection: TextDirection.rtl,

                          children: [
                            Icon(
                              Icons.storage_outlined,
                              size: 23,
                              color: AppColor.grey3,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "البيانات التي نجمعها",
                              style: GoogleFonts.ibmPlexSans(
                                color: AppColor.getBlack(context),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          "أسانيد نموذج أولي يعمل بالكامل دون اتصال. لا تُرسَل أي بيانات شخصية إلى أي خادم. البيانات الوحيدة المخزّنة هي تقدم قراءتك وعلاماتك المرجعية، وتُحفظ في تخزين المتصفح على جهازك (localStorage).",
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 16,
                            color: AppColor.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFF2C3630) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1.5, color: AppColor.border),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Row(
                          textDirection: TextDirection.rtl,

                          children: [
                            Icon(
                              Icons.lock_outline,
                              size: 23,
                              color: AppColor.grey3,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "التخزين المحلي",
                              style: GoogleFonts.ibmPlexSans(
                                color: AppColor.getBlack(context),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          "جميع البيانات (المحفوظات، تقدم القراءة، التفضيلات) تُخزَّن حصراً في localStorage بمتصفحك تحت المفاتيح 'asaneed_*'. لا تغادر هذه البيانات جهازك أبداً. مسح تخزين المتصفح سيؤدي إلى حذف جميع البيانات المحفوظة.",
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 16,
                            color: AppColor.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFF2C3630) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1.5, color: AppColor.border),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Row(
                          textDirection: TextDirection.rtl,

                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,                              size: 23,
                              color: AppColor.grey3,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "كيف تُستخدم بياناتك",
                              style: GoogleFonts.ibmPlexSans(
                                color: AppColor.getBlack(context),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          "تُستخدم بياناتك المخزّنة محلياً فقط لتوفير تجربة دراسة سلسة: استئناف القراءة، وعرض محفوظاتك، وتذكّر إعدادات العرض. لا يجري أي تتبع أو تحليل من أي نوع.",
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 16,
                            color: AppColor.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFF2C3630) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1.5, color: AppColor.border),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Row(
                          textDirection: TextDirection.rtl,

                          children: [
                            Icon(
                              Icons.verified_user_outlined,                              size: 23,
                              color: AppColor.grey3,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "حقوقك",
                              style: GoogleFonts.ibmPlexSans(
                                color: AppColor.getBlack(context),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          "بما أن جميع البيانات تُخزَّن محلياً على جهازك، فلديك السيطرة الكاملة عليها. يمكنك حذف جميع البيانات المخزّنة في أي وقت بمسح localStorage في متصفحك. لا حاجة لطلب حذف حساب لأنه لا توجد بيانات محفوظة على أي خادم.",
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 16,
                            color: AppColor.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFF2C3630) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1.5, color: AppColor.border),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Row(
                          textDirection: TextDirection.rtl,

                          children: [
                            Icon(
                              Icons.mail_outline,                              size: 23,
                              color: AppColor.grey3,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "التواصل",
                              style: GoogleFonts.ibmPlexSans(
                                color: AppColor.getBlack(context),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1.5, color: AppColor.border),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          "هذا تطبيق نموذجي للأغراض التوضيحية فقط. للاستفسار عن مشروع أسانيد، يرجى التواصل مع فريق التطوير عبر مستودع المشروع.",
                          style: GoogleFonts.ibmPlexSans(
                            fontSize: 16,
                            color: AppColor.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
