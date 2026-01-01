import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/features/profile/presentation/views/tabs/info_screen2.dart';
import 'package:asaneed/features/profile/presentation/views/tabs/morwayat_screen.dart'
    show MorwayatScreen;
import 'package:asaneed/features/profile/presentation/views/tabs/person_screen.dart';
import 'package:asaneed/features/profile/presentation/views/tabs/students_screen.dart';
import 'package:asaneed/features/profile/presentation/widgets/buildTabIcon.dart';
import 'package:asaneed/features/profile/presentation/widgets/iconTagWithText.dart';
import 'package:asaneed/features/profile/presentation/widgets/infoCard.dart';
import 'package:asaneed/features/profile/presentation/widgets/tag.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../theme/AppThemeManager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const int tabsCount = 4;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabsCount,
      vsync: this,
      initialIndex: 3,
    );
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    return Scaffold(
      backgroundColor:
      isDark ? const Color(0xFF111814) : const Color(0xFFF9F7F2),

      appBar: AppBar(
        backgroundColor: AppColor.getAppBarColor(context),
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "الرواة",
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getBlack(context),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: AppColor.getBlack(context),
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, PageRouteName.homeScreen);
                },
              ),
            ],
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            themeManager.toggleTheme();
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.07),
            ),
            child: Icon(
              isDark ? Icons.wb_sunny_rounded : Icons.nightlight_round,
              size: 24,
              color: isDark ? Colors.grey[400] : AppColor.primary,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -------- Header --------
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                gradient: isDark
                    ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.45, 0.75, 1.0],
                  colors: [
                    Color(0xFF020403),
                    Color(0xFF0B1A16),
                    Color(0xFF1E3E32),
                    Color(0xFF2F5D4B),
                  ],
                )
                    : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.4, 0.7, 1.0],
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFF2F6F1),
                    Color(0xFFDCE9E1),
                    Color(0xFFC5DACC),
                  ],
                ),
              ),

              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: AppColor.getContainerColor(context),
                      border:
                      Border.all(color: Colors.white.withOpacity(0.08)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "أ",
                      style: GoogleFonts.amiriQuran(
                        fontSize: 38,
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "أبو بكر الصديق",
                    style: GoogleFonts.tajawal(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColor.primary,

                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconTagWithText(
                        icon: Icons.calendar_month_rounded,
                        color: AppColor.primary2,
                        label: "توفي 13 هـ",
                      ),
                      const SizedBox(width: 8),
                      tag("ثقة", AppColor.primary2),
                      const SizedBox(width: 8),
                      tag("صحابي", AppColor.primary2),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),

            /// -------- Stats --------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                InfoCard(
                  number: "0",
                  title: "مرويات",
                  icon: Icons.menu_book,
                  iconColor: AppColor.primary,
                ),
                SizedBox(width: 12),
                InfoCard(
                  number: "5",
                  title: "تلاميذه",
                  icon: Icons.group,
                  iconColor: AppColor.blue,
                ),
                SizedBox(width: 12),
                InfoCard(
                  number: "1",
                  title: "شيوخه",
                  icon: Icons.person,
                  iconColor: AppColor.primary3,
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// -------- Bottom Tabs --------
            Center(
              child: Container(
                height: 64,
                width: 360,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColor.getContainerColor(context),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Stack(
                  children: [
                    /// Indicator
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      alignment: Alignment(
                        -1 +
                            (_tabController.index *
                                2 /
                                (tabsCount - 1)),
                        0,
                      ),
                      child: Container(
                        width: 290 / tabsCount,
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),

                    /// Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildTabIcon(
                          icon: Icons.menu_book_outlined,

                          isSelected: _tabController.index == 0,
                          onTap: () =>
                              setState(() => _tabController.index = 0),
                        ),
                        buildTabIcon(
                          icon: Icons.person_outline,
                          isSelected: _tabController.index == 1,
                          onTap: () =>
                              setState(() => _tabController.index = 1),
                        ),
                        buildTabIcon(
                          icon: Icons.group_outlined,
                          isSelected: _tabController.index == 2,
                          onTap: () =>
                              setState(() => _tabController.index = 2),
                        ),
                        buildTabIcon(
                          icon: Icons.info_outline,
                          isSelected: _tabController.index == 3,
                          onTap: () =>
                              setState(() => _tabController.index = 3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// -------- Content --------
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: IndexedStack(
                index: _tabController.index,
                children: const [
                  MorwayatScreen(),
                  PersonScreen(),
                  StudentsScreen(),
                  InfoScreen2(),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
