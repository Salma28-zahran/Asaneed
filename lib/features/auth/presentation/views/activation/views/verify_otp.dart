import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/auth/presentation/views/activation/bloc/activ_cubit.dart';
import 'package:asaneed/features/auth/presentation/views/activation/bloc/activ_state.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late String email;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    email = ModalRoute.of(context)!.settings.arguments as String;
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
    return controllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return BlocProvider(
      create: (_) => ActivateCubit(),
      child: BlocConsumer<ActivateCubit, ActivState>(
        listener: (context, state) {
          if (state is ActivateSuccessState) {
            setState(() {
              isSuccess = true;
            });
          }

          if (state is FailedToActivateState) {
            setState(() {
              hasError = true;
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: isDark ? const Color(0xff111814) : Colors.white,

            body: SingleChildScrollView(
              child: SafeArea(
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
                          color:
                              isDark ? Colors.white : const Color(0xff1F2923),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "الأحاديث النبوية وعلم الأسانيد",
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 14,
                          color:
                              isDark
                                  ? const Color(0xff9CA3AF)
                                  : const Color(0xff6B7280),
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
                            color:
                                isDark
                                    ? const Color(0xff16221D)
                                    : const Color(0xffF9F7F2),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child:
                              isSuccess
                                  ? _buildSuccess()
                                  : _buildOtpContent(context, state),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ================= OTP CONTENT =================

  Widget _buildOtpContent(BuildContext context, ActivState state) {
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

        const SizedBox(height: 20),

        if (hasError)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xffFDE8E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "الرمز غير صحيح",
              style: GoogleFonts.ibmPlexSansArabic(color: Colors.red),
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
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).previousFocus();
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
              final code = getCode();

              context.read<ActivateCubit>().activateAccount(
                email: email,
                activationCode: code,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child:
                state is ActivateLoadingState
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                      "تحقق من الرمز",
                      style: GoogleFonts.ibmPlexSansArabic(color: Colors.white),
                    ),
          ),
        ),

        const SizedBox(height: 14),

        Center(
          child: Text(
            "إعادة إرسال الرمز",
            style: GoogleFonts.ibmPlexSansArabic(color: AppColor.primary),
          ),
        ),
      ],
    );
  }

  // ================= SUCCESS =================

  Widget _buildSuccess() {
    return Column(
      children: [
        const Icon(Icons.check, size: 40, color: Colors.green),
        const SizedBox(height: 16),
        Text(
          "تم التفعيل بنجاح",
          style: GoogleFonts.ibmPlexSansArabic(fontSize: 18),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, PageRouteName.login);
          },
          child: const Text("العودة لتسجيل الدخول"),
        ),
      ],
    );
  }
}
