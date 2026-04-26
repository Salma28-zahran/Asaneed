import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/auth/presentation/views/forget_pass/bloc/forget_cubit.dart';
import 'package:asaneed/features/auth/presentation/views/forget_pass/bloc/forget_state.dart';
import 'package:asaneed/features/auth/presentation/views/widgets/build_text_field.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetEmail extends StatefulWidget {
  const ForgetEmail({super.key});

  @override
  State<ForgetEmail> createState() => _ForgetEmailState();
}

class _ForgetEmailState extends State<ForgetEmail> {
  final TextEditingController emailController = TextEditingController();
  bool isFilled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isFilled = emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return BlocProvider(
      create: (_) => PasswordResetCubit(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: BlocConsumer<PasswordResetCubit, PasswordResetState>(
            listener: (context, state) {
              if (state is RequestResetSuccessState) {
                print("SUCCESS: ${state.message}");

                Navigator.pushNamed(context, PageRouteName.passotp);
              }

              if (state is RequestResetErrorState) {
                print("ERROR: ${state.error}");

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return Column(
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
                          color: isDark ? Colors.grey[700] : AppColor.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Image.asset(AssetsManager.logo4, width: 85),

                  Text(
                    "أسانيد",
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff1F2923),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "الأحاديث النبوية وعلم الأسانيد",
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 14,
                      color: const Color(0xff6B7280),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Container(
                      width: 390,
                      height: 340,
                      margin: const EdgeInsets.only(
                        bottom: 16,
                        top: 16,
                        right: 16,
                        left: 16,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.getContainerColor(context),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Colors.grey.shade600,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "العودة لتسجيل الدخول",
                                  style: GoogleFonts.ibmPlexSansArabic(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 6),
                                Text(
                                  "نسيت كلمة المرور",
                                  style: GoogleFonts.scheherazadeNew(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.getBlack(context),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "أدخل بريدك الإلكتروني لاستلام رابط إعادة التعيين",
                                  style: GoogleFonts.ibmPlexSansArabic(
                                    fontSize: 14,
                                    color: const Color(0xff6B7280),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "البريد الإلكتروني",
                              style: GoogleFonts.ibmPlexSansArabic(
                                fontSize: 14,
                                color: const Color(0xff1F2923),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BuildTextField(
                              hint: "البريد الإلكتروني",
                              obscure: false,
                              controller: emailController,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Center(
                            child: SizedBox(
                              width: 311,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: isFilled
                                    ? () {
                                  print("EMAIL: ${emailController.text}");

                                  context
                                      .read<PasswordResetCubit>()
                                      .requestReset(
                                    email: emailController.text,
                                  );
                                }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: isFilled
                                      ? const Color(0xff2F5D4B)
                                      : const Color(0xff8FA69A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: state is RequestResetLoadingState
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "طلب الوصول",
                                      style: GoogleFonts
                                          .ibmPlexSansArabic(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.person_add,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}