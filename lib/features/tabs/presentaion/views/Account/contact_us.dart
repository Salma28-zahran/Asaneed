import 'package:asaneed/features/tabs/presentaion/views/Account/widgets/custom_app_bar_account.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../core/route/routes.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeManager>().isDarkMode;

    return Scaffold(
      backgroundColor: isDark ? Color(0xFF111814) : Color(0xFFF6F5F0),
      appBar: CustomAppBarAccount(title: "تواصل معنا"),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _topCard(
                      context,
                      icon: Icons.help_outline,
                      title: "المساعدة",
                      subtitle: "ابحث في الأسئلة الشائعة قبل التواصل.",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _topCard(
                      context,
                      icon: Icons.warning_amber_outlined,
                      title: "الشروط",
                      subtitle: "اطلع على شروط الاستخدام.",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1.2, color: AppColor.border),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "أو أرسل لنا رسالة",
                      style: GoogleFonts.scheherazadeNew(
                        color: AppColor.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1.2, color: AppColor.border),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              _buildLabel(
                context,
                "الاسم الكامل",
                required: true,
                icon: Icons.person_2_outlined,
              ),
              const SizedBox(height: 6),
              _buildTextField(context, hint: "محمد مصطفي"),

              SizedBox(height: 16),

              _buildLabel(
                context,
                "البريد الإلكتروني",
                required: true,
                icon: Icons.mail_outline,
              ),
              SizedBox(height: 6),
              _buildTextField(context, hint: "mohamed@gmail.com"),

              SizedBox(height: 16),

              _buildLabel(context, "الموضوع", icon: Icons.message),
              SizedBox(height: 6),
              _buildTextField(context, hint: "سؤال عام"),

              SizedBox(height: 16),

              _buildLabel(
                context,
                "الرسالة",
                required: true,
                icon: Icons.message,
              ),
              SizedBox(height: 6),
              _buildTextField(
                context,
                hint: "اشرح سؤالك أو مشكلتك بالتفصيل...",
                maxLines: 5,
              ),

              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  label: Text(
                    "إرسال الرسالة",
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  icon: Icon(Icons.send, color: Colors.white),
                ),
              ),

              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تُستخدم معلوماتك فقط للرد على استفسارك. ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.scheherazadeNew(
                      color: AppColor.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRouteName.privacy);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "راجع سياسة الخصوصية",
                      style: GoogleFonts.scheherazadeNew(
                        fontSize: 12,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.2,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _topCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final isDark = context.watch<AppThemeManager>().isDarkMode;

    return Container(
      padding: const EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2C3630) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.border, width: 1.2),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Icon(icon, color: AppColor.primary, size: 28),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.right,
              style: GoogleFonts.scheherazadeNew(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColor.getBlack(context),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.right,
              style: GoogleFonts.scheherazadeNew(
                fontSize: 14,
                color: AppColor.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= Label =================

  Widget _buildLabel(
    BuildContext context,
    String text, {
    bool required = false,
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColor.grey3, size: 28),
        Text(
          text,
          style: GoogleFonts.scheherazadeNew(
            fontWeight: FontWeight.w500,
            color: AppColor.getBlack(context),
            fontSize: 17,
          ),
        ),
        if (required)
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "مطلوب",
                style: GoogleFonts.scheherazadeNew(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.getBlack(context),
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// ================= TextField =================

  Widget _buildTextField(
    BuildContext context, {
    required String hint,
    int maxLines = 1,
  }) {
    final isDark = context.watch<AppThemeManager>().isDarkMode;

    return TextField(
      maxLines: maxLines,
      style: TextStyle(color: AppColor.getBlack(context)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColor.grey),
        filled: true,
        fillColor: isDark ? Color(0xFF2C3630) : Color(0xFFF3F4F6),

        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColor.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColor.primary),
        ),
      ),
    );
  }
}
