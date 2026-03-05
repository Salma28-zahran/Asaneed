import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/app_assets_manager.dart';

class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  bool isSuccess = false;

  @override
  void dispose() {
    passwordController.dispose();
    passwordController2.dispose();
    super.dispose();
  }

  void checkPasswords() {
    if (passwordController.text == passwordController2.text &&
        passwordController.text.isNotEmpty) {
      setState(() {
        isSuccess = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("كلمتا المرور غير متطابقتين"),
        ),
      );
    }
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
              /// Theme toggle
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: GestureDetector(
                    onTap: () {
                      themeManager.toggleTheme();
                    },
                    child: Icon(
                      isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                      size: 24,
                      color: isDark ? Colors.grey[700] : AppColor.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Logo
              Image.asset(AssetsManager.logo4, width: 85),

              /// Title
              Text(
                "أسانيد",
                style: GoogleFonts.scheherazadeNew(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff1F2923),
                ),
              ),

              const SizedBox(height: 4),

              /// Subtitle
              Text(
                "الأحاديث النبوية وعلم الأسانيد",
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 14,
                  color: const Color(0xff6B7280),
                ),
              ),

              const SizedBox(height: 20),

              /// الكونتينر الأساسي
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffF9F7F2),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: isSuccess
                        ? successContainer()
                        : passwordForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// الفورم الأساسي
  Widget passwordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xffE6F0EC),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.verified_user, color: AppColor.primary),
            ),
            const SizedBox(width: 8),
            Text(
              "تعيين كلمة مرور جديدة",
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        Text(
          "أدخل كلمة مرورك الجديدة وأكدها.",
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 14,
            color: const Color(0xff6B7280),
          ),
        ),

        const SizedBox(height: 16),

        /// password
        Text(
          "كلمة المرور الجديدة",
          style: GoogleFonts.ibmPlexSansArabic(fontSize: 14),
        ),
        const SizedBox(height: 5),

        PasswordTextField(
          hint: "••••••••",
          obscure: !isPasswordVisible,
          controller: passwordController,
          showEye: true,
          onEyeTap: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),

        const SizedBox(height: 16),

        /// confirm password
        Text(
          "تأكيد كلمة المرور",
          style: GoogleFonts.ibmPlexSansArabic(fontSize: 14),
        ),
        const SizedBox(height: 5),

        PasswordTextField(
          hint: "••••••••",
          obscure: !isConfirmPasswordVisible,
          controller: passwordController2,
          showEye: true,
          onEyeTap: () {
            setState(() {
              isConfirmPasswordVisible =
              !isConfirmPasswordVisible;
            });
          },
        ),

        const SizedBox(height: 25),

        /// زرار الحفظ
        Center(
          child: SizedBox(
            width: 311,
            height: 55,
            child: ElevatedButton(
              onPressed: checkPasswords,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "حفظ كلمة المرور",
                style: GoogleFonts.ibmPlexSansArabic(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// كونتينر النجاح
  Widget successContainer() {
    return Column(
      children: [
        const SizedBox(height: 10),

        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xffDDF2E4),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check_circle,
            color: AppColor.primary,
            size: 40,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          "تم تغيير كلمة المرور بنجاح",
          textAlign: TextAlign.center,
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "يمكنك الآن تسجيل الدخول بكلمة المرور الجديدة.",
          textAlign: TextAlign.center,
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 14,
            color: const Color(0xff6B7280),
          ),
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: 311,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, PageRouteName.login);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "العودة لتسجيل الدخول",
                  style: GoogleFonts.ibmPlexSansArabic(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.login, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// TextField Widget
class PasswordTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final bool showEye;
  final VoidCallback? onEyeTap;

  const PasswordTextField({
    super.key,
    required this.hint,
    required this.obscure,
    required this.controller,
    this.showEye = false,
    this.onEyeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xffE2E0D8),
        borderRadius: BorderRadius.circular(30),
      ),
      child:
      TextField(
        controller: controller,
        obscureText: obscure,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.ibmPlexSansArabic(
            color: const Color(0xff9CA3AF),
          ),
          prefixIcon: showEye
              ? GestureDetector(
            onTap: onEyeTap,
            child: const Icon(
              Icons.visibility_outlined,
              color: Color(0xff6B7280),
            ),
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
        ),
      )
    );
  }
}