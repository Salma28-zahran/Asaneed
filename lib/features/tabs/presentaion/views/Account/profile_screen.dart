import 'package:asaneed/features/tabs/presentaion/views/Account/widgets/option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/route/routes.dart';
import 'bloc/acc_cubit.dart';
import 'bloc/acc_states.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String name = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadUserData();
  }

  void loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString("name") ?? "مستخدم";
      email = prefs.getString("email") ?? "example@email.com";
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeManager>().isDarkMode;

    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {


        if (state is LogoutSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            PageRouteName.login,
                (route) => false,
          );
        }

        if (state is LogoutError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: AppColor.getAppBarColor(context),
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "حسابي",
              style: GoogleFonts.scheherazadeNew(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, PageRouteName.homeScreen);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    height: 150,
                    decoration: BoxDecoration(
                      color: isDark ? Color(0xFF2C3630) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1.5, color: AppColor.border),
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColor.primary.withOpacity(0.20),
                          ),
                          child: Icon(
                            Icons.person_2_outlined,
                            size: 30,
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name,
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.getBlack(context),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                email,
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 15,
                                  color: AppColor.grey3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  Container(
                    height: 145,
                    decoration: BoxDecoration(
                      color: isDark ? Color(0xFF2C3630) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1.5, color: AppColor.border),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(Icons.light_mode_outlined,
                                  color: AppColor.grey3),
                              SizedBox(width: 10),
                              Text(
                                "المظهر",
                                style: GoogleFonts.scheherazadeNew(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),

                        GestureDetector(
                          onTap: () {
                            context.read<AppThemeManager>().toggleTheme();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Icon(
                                  isDark
                                      ? Icons.dark_mode_outlined
                                      : Icons.light_mode_outlined,
                                ),
                                SizedBox(width: 10),
                                Text(isDark ? "الوضع النهاري" : "الوضع الليلي"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? Color(0xFF2C3630) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1.5, color: AppColor.border),
                    ),
                    child: Column(
                      children: [
                        OptionItem(
                          icon: Icons.lock_outline,
                          title: "سياسة الخصوصية",
                          subtitle: "اطلع علي كيفية التعامل مع بياناتك",
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageRouteName.privacy);
                          },
                        ),
                        Divider(),

                        OptionItem(
                          icon: Icons.description_outlined,
                          title: "الشروط و الاحكام",
                          subtitle: "مراجعة شروط استخدام النموذج",
                          onTap: () {
                            Navigator.pushNamed(context, PageRouteName.terms);
                          },
                        ),
                        Divider(),

                        OptionItem(
                          icon: Icons.mail_outline,
                          title: "تواصل معنا",
                          subtitle: "ارسل لنا رسالة",
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageRouteName.contact);
                          },
                        ),

                        Divider(),

                        // ================= LOGOUT =================
                        InkWell(
                          onTap: () {
                            context.read<LogoutCubit>().logout();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Icon(Icons.logout, color: Colors.red),
                                SizedBox(width: 10),
                                Text(
                                  "تسجيل الخروج",
                                  style: GoogleFonts.scheherazadeNew(
                                    color: Colors.red,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}