import 'package:asaneed/core/resources/app_assets_manager.dart';
import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/auth/presentation/views/register/bloc/register_cubit.dart';
import 'package:asaneed/features/auth/presentation/views/register/bloc/register_state.dart';
import 'package:asaneed/theme/AppThemeManager.dart' show AppThemeManager;
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  bool isFilled = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_checkFields);
    emailController.addListener(_checkFields);
    passwordController.addListener(_checkFields);
    passwordController2.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isFilled =
          emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty &&
              nameController.text.isNotEmpty &&
              passwordController2.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                Navigator.pushNamed(context, PageRouteName.verify_otp);
              } else if (state is FailedToRegisterState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
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
                          isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                          size: 24,
                          color: isDark ? Colors.grey[700] : AppColor.primary,
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
                      color: const Color(0xff1F2923),
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
                        top: 16,
                        right: 16,
                        left: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffF9F7F2),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: const Color(0xffD1D5DB),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  const SizedBox(height: 6),
                                  Text(
                                    "إنشاء حساب",
                                    style: GoogleFonts.scheherazadeNew(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff1F2923),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "أدخل بياناتك لطلب الوصول",
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      fontSize: 14,
                                      color: const Color(0xff6B7280),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "الاسم الكامل",
                              style: GoogleFonts.ibmPlexSansArabic(
                                fontSize: 14,
                                color: const Color(0xff1F2923),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildTextField(
                              hint: "اسمك",
                              obscure: false,
                              controller: nameController,
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
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildTextField(
                              hint: "you@example.com",
                              obscure: false,
                              controller: emailController,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "كلمة المرور",
                              style: GoogleFonts.ibmPlexSansArabic(
                                fontSize: 14,
                                color: const Color(0xff1F2923),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildTextField(
                              hint: "••••••••",
                              obscure: true,
                              controller: passwordController,
                              showEye: true,
                              isVisible: isPasswordVisible,
                              onToggle: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "تأكيد كلمة المرور",
                              style: GoogleFonts.ibmPlexSansArabic(
                                fontSize: 14,
                                color: const Color(0xff1F2923),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _buildTextField(
                              hint: "••••••••",
                              obscure: true,
                              controller: passwordController2,
                              showEye: true,
                              isVisible: isConfirmPasswordVisible,
                              onToggle: () {
                                setState(() {
                                  isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                                });
                              },
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
                                  context.read<RegisterCubit>().register(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    confirmPassword:
                                    passwordController2.text,
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
                                child: state is RegisterLoadingState
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "طلب الوصول",
                                      style:
                                      GoogleFonts.ibmPlexSansArabic(
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
                          const SizedBox(height: 24),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "لديك حساب بالفعل؟ ",
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      color: const Color(0xff6B7280),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "تسجيل الدخول",
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      color: AppColor.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context, PageRouteName.login);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 19),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required bool obscure,
    required TextEditingController controller,
    bool showEye = false,
    bool isVisible = false,
    VoidCallback? onToggle,
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
        obscureText: showEye ? !isVisible : obscure,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.ibmPlexSansArabic(
            color: const Color(0xff9CA3AF),
            fontSize: 15,
          ),
          prefixIcon: showEye
              ? IconButton(
            icon: Icon(
              isVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 22,
              color: const Color(0xff6B7280),
            ),
            onPressed: onToggle,
          )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}