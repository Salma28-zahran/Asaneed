import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../../theme/app_theme.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}


class _VerifyOtpState extends State<VerifyOtp> {
  bool hasError = false;
  bool isSuccess = false;

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: GestureDetector(
                    onTap: () {
                      themeManager.toggleTheme();
                    },
                    child: Icon(
                      isDark
                          ? Icons.nightlight_round
                          : Icons.wb_sunny_rounded,
                      size: 24,
                      color:
                      isDark ? Colors.grey[700] : AppColor.primary,
                    ),
                  ),
                ),
              ),

              Image.asset(AssetsManager.logo4, width: 85),

              Text(
                "أسانيد",
                style: GoogleFonts.scheherazadeNew(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primary,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                "الأحاديث النبوية وعلم الأسانيد",
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 14,
                  color: const Color(0xff6B7280),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 16,
                  ),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xffF9F7F2),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: const Color(0xffD1D5DB),
                      width: 1,
                    ),
                  ),
                  child: isSuccess
                      ? _buildSuccess()
                      : _buildOtpContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= OTP CONTENT =================

  Widget _buildOtpContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xffE6F0EC),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.verified_user, color: AppColor.primary),
                ),
                const SizedBox(width: 8),
                Text(
                  "تحقق من بريدك الإلكتروني",
                  style: GoogleFonts.ibmPlexSansArabic(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Text(
              "أرسلنا رمز مكون من 6 أرقام إلى",
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 14,
                color: const Color(0xff6B7280),
              ),
              textAlign: TextAlign.right,
            ),

            const SizedBox(height: 2),

            Text(
              "you@example.com",
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),





        const SizedBox(height: 16),

        if (hasError)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xffFDE8E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "الرمز غير صحيح، يرجى المحاولة مرة أخرى.",
              style: GoogleFonts.ibmPlexSansArabic(
                color: Colors.red,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            6,
                (index) => Container(
              width: 38,
              height: 44,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: const Color(0xffE2E0D8),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    if (index < 5) {
                      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                    } else {
                      focusNodes[index].unfocus();
                    }
                  } else {
                    if (index > 0) {
                      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                    }
                  }
                },
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isSuccess = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "تحقق من الرمز",
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(height: 14),

        /// إعادة إرسال الرمز + أيقونة
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.rtl,
            children: [
              Icon(
                Icons.refresh,
                size: 18,
                color: AppColor.primary,
              ),
              const SizedBox(width: 6),
              Text(
                "إعادة إرسال الرمز",
                style: GoogleFonts.ibmPlexSansArabic(
                  color: AppColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.rtl,
          children: [

            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  PageRouteName.register,
                      (route) => false,
                );
              },
              child:
              Row(
                textDirection: TextDirection.rtl,
                children: [
              
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "تغيير البريد",
                    style: GoogleFonts.ibmPlexSansArabic(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
              
                ],
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  PageRouteName.login,
                      (route) => false,
                );
              },
              child: Text(
                "العودة لتسجيل الدخول",
                style: GoogleFonts.ibmPlexSansArabic(
                  color: AppColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ================= SUCCESS CONTENT =================

  Widget _buildSuccess() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xffE6F4EA),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            size: 40,
            color: AppColor.primary,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          "تم تفعيل الحساب بنجاح",
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "تم تفعيل حسابك ويمكنك المتابعة الآن.",
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 14,
            color: const Color(0xff6B7280),
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, PageRouteName.login);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "المتابعة إلى التطبيق",
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
