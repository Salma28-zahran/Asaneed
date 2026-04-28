import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/auth/presentation/views/forget_pass/bloc/forget_cubit.dart';
import 'package:asaneed/features/auth/presentation/views/forget_pass/bloc/forget_state.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/resources/app_assets_manager.dart';

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

  @override
  void dispose() {
    passwordController.dispose();
    passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    final String email =
        ModalRoute.of(context)?.settings.arguments as String? ?? "";

    return BlocProvider(
      create: (_) => PasswordResetCubit(),
      child: BlocConsumer<PasswordResetCubit, PasswordResetState>(
        listener: (context, state) {
          if (state is CompleteResetSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );

            Navigator.pushNamed(context, PageRouteName.login);
          }

          if (state is CompleteResetErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
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

                    const SizedBox(height: 20),

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
                          child: passwordForm(context, email, state),
                        ),
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

  Widget passwordForm(
      BuildContext context,
      String email,
      PasswordResetState state,
      ) {
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

        const SizedBox(height: 16),

        TextField(
          controller: passwordController,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            hintText: "كلمة المرور الجديدة",
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              icon: const Icon(Icons.visibility),
            ),
          ),
        ),

        const SizedBox(height: 16),

        TextField(
          controller: passwordController2,
          obscureText: !isConfirmPasswordVisible,
          decoration: InputDecoration(
            hintText: "تأكيد كلمة المرور",
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isConfirmPasswordVisible = !isConfirmPasswordVisible;
                });
              },
              icon: const Icon(Icons.visibility),
            ),
          ),
        ),

        const SizedBox(height: 25),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: state is CompleteResetLoadingState
                ? null
                : () {
              if (passwordController.text != passwordController2.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("كلمتا المرور غير متطابقتين"),
                  ),
                );
                return;
              }

              context.read<PasswordResetCubit>().completeReset(
                email: email,
                newPassword: passwordController.text,
                confirmPassword: passwordController2.text,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: state is CompleteResetLoadingState
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
              "حفظ كلمة المرور",
              style: GoogleFonts.ibmPlexSansArabic(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}