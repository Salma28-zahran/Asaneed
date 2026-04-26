import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/auth/presentation/views/login/bloc/login_cubit.dart';
import 'package:asaneed/features/auth/presentation/views/login/bloc/login_state.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isFilled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isFilled =
          emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LogInSuccessState) {
            Navigator.pushNamed(context, PageRouteName.homeScreen);
          }

          if (state is FailedToLogInState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor:
            isDark ? const Color(0xff111814) : Colors.white,
            body: SafeArea(
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

                  const SizedBox(height: 10),

                  Image.asset(AssetsManager.logo4, width: 85),

                  Text(
                    "أسانيد",
                    style: GoogleFonts.scheherazadeNew(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? Colors.white
                          : const Color(0xff1F2923),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "الأحاديث النبوية وعلم الأسانيد",
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 14,
                      color: isDark
                          ? const Color(0xff9CA3AF)
                          : const Color(0xff6B7280),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Container(
                      width: 390,
                      height: 410,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xff16221D)
                            : const Color(0xffF9F7F2),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              child: Column(
                                children: [
                                  const SizedBox(height: 6),
                                  Text(
                                    "تسجيل الدخول",
                                    style: GoogleFonts.scheherazadeNew(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: isDark
                                          ? Colors.white
                                          : const Color(0xff1F2923),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "أدخل بياناتك للمتابعة",
                                    style:
                                    GoogleFonts.ibmPlexSansArabic(
                                      fontSize: 14,
                                      color: isDark
                                          ? const Color(0xff9CA3AF)
                                          : const Color(0xff6B7280),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 3),

                          Padding(
                            padding:
                            const EdgeInsets.only(right: 20),
                            child: Text(
                              "البريد الإلكتروني",
                              style: GoogleFonts.ibmPlexSansArabic(
                                fontSize: 14,
                                color: isDark
                                    ? Colors.white
                                    : const Color(0xff1F2923),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildTextField(
                              hint: "you@example.com",
                              obscure: false,
                              controller: emailController,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator
                                        .pushNamedAndRemoveUntil(
                                      context,
                                      PageRouteName.forget_email,
                                          (route) => false,
                                    );
                                  },
                                  child: Text(
                                    "نسيت كلمة المرور؟",
                                    style: GoogleFonts
                                        .ibmPlexSansArabic(
                                      fontSize: 13,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 180),
                                Text(
                                  "كلمة المرور",
                                  style: GoogleFonts
                                      .ibmPlexSansArabic(
                                    fontSize: 14,
                                    color: isDark
                                        ? Colors.white
                                        : const Color(0xff1F2923),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 8),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildTextField(
                              hint: "••••••••",
                              obscure: true,
                              controller: passwordController,
                              showEye: true,
                            ),
                          ),

                          const SizedBox(height: 30),

                          Center(
                            child: SizedBox(
                              width: 311,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: isFilled
                                    ? () {
                                  context
                                      .read<LoginCubit>()
                                      .login(
                                    email: emailController.text,
                                    password:
                                    passwordController.text,
                                  );
                                }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: isFilled
                                      ? const Color(0xff2F5D4B)
                                      : const Color(0xff8FA69A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(30),
                                  ),
                                ),
                                child: state is LogInLoadingState
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "تسجيل الدخول",
                                      style: GoogleFonts
                                          .ibmPlexSansArabic(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.login,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "ليس لديك حساب؟ ",
                                    style: GoogleFonts
                                        .ibmPlexSansArabic(
                                      color:
                                      const Color(0xff6B7280),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "إنشاء حساب",
                                    style: GoogleFonts
                                        .ibmPlexSansArabic(
                                      color: AppColor.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                          context,
                                          PageRouteName.register,
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required bool obscure,
    required TextEditingController controller,
    bool showEye = false,
  }) {
    return Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xffE2E0D8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsetsDirectional.only(end: 22),
          border: InputBorder.none,
        ),
      ),
    );
  }
}