import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/auth/presentation/views/forget_pass/bloc/forget_cubit.dart';
import 'package:asaneed/features/auth/presentation/views/forget_pass/bloc/forget_state.dart';
import 'package:asaneed/features/auth/presentation/views/forget_pass/views/new_pass.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PassOtp extends StatefulWidget {
  const PassOtp({super.key});

  @override
  State<PassOtp> createState() => _PassOtpState();
}

class _PassOtpState extends State<PassOtp> {
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

  String getCode() {
    return controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    // email جاي من الصفحة اللي قبلها (ForgetEmail)
    final String email =
        ModalRoute.of(context)?.settings.arguments as String? ?? "";

    return BlocProvider(
      create: (_) => PasswordResetCubit(),
      child: BlocConsumer<PasswordResetCubit, PasswordResetState>(
        listener: (context, state) {
          if (state is VerifyCodeSuccessState) {
            setState(() {
              isSuccess = true;
              hasError = false;
            });

            Navigator.pushNamed(context, PageRouteName.new_pass);
          }

          if (state is VerifyCodeErrorState) {
            setState(() {
              hasError = true;
            });
          }
        },
        builder: (context, state) {
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
                            color: isDark
                                ? Colors.grey[700]
                                : AppColor.primary,
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
                            : _buildOtpContent(context, email, state),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOtpContent(
      BuildContext context,
      String email,
      PasswordResetState state,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
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
        ),

        const SizedBox(height: 2),

        Text(
          email.isEmpty ? "you@example.com" : email,
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
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
                decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: state is VerifyCodeLoadingState
                ? null
                : () {
              final code = getCode();

              context.read<PasswordResetCubit>().verifyCode(
                email: email,
                code: code,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: state is VerifyCodeLoadingState
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
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
      ],
    );
  }

  Widget _buildSuccess() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: Color(0xffE6F4EA),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 40, color: AppColor.primary),
        ),
        const SizedBox(height: 16),
        const Text("تم التحقق بنجاح"),
      ],
    );
  }
}