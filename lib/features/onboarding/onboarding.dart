import 'package:asaneed/theme/AppThemeManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/resources/app_assets_manager.dart';
import '../../core/route/routes.dart';
import '../../theme/app_theme.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<AppThemeManager>();
    final isDark = themeManager.isDarkMode;

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // ===== TOP ROW (MODE ICON + SKIP) =====
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.04,
                      right: width * 0.04,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
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

                        TextButton(
                          onPressed: () => _controller.jumpToPage(2),
                          child: Text(
                            "تخطي",
                            style: TextStyle(
                              color: AppColor.grey,
                              fontSize: width * 0.04,
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),

                  // ===== PAGE VIEW =====
                  Expanded(
                    child: PageView(
                      controller: _controller,
                      onPageChanged: (i) => setState(() => _currentPage = i),
                      children: [
                        _buildPage(

                          context: context,
                          image: AssetsManager.onboard1,
                          title: "موسوعة الحديث النبوي",
                          description:
                          "تصفح آلاف الأحاديث النبوية من المصادر \nالمعتمدة مع الترجمة الإيضاحية.",
                        ),
                        _buildPage(
                          context: context,
                          image: AssetsManager.onboard2,
                          title: "تتبع الأسانيد",
                          description:
                          "اكتشف سلسلة الرواة عبر الزمن باستخدام \nالرسوم البيانية والتفسيرات التفاعلية.",
                        ),
                        _buildPage(
                          context: context,
                          image: AssetsManager.onboard3,
                          title: "تحقق من الصحة",
                          description:
                          "اعرف درجة صحة الحديث وحالة كل راوٍ من حيث \n الثقة والضبط.",
                        ),
                      ],
                    ),
                  ),

                  // ==== INDICATOR =====
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      bool isActive = _currentPage == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                        height: 8,
                        width: isActive ? 26 : 8,
                        decoration: BoxDecoration(
                          color: isActive ? AppColor.primary : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),

                  // ===== BOTTOM BUTTON (FIXED FOR ALL) =====
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: height * 0.05,
                      top: height * 0.03,
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.08),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage < 2) {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, PageRouteName.homeScreen);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _currentPage == 2 ? "ابدأ الآن" : "التالي",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.white,
                                ),
                              ),

                              if (_currentPage != 2) ...[
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ========= PAGE BUILDER ==========
  Widget _buildPage({
    required BuildContext context,
    required String image,
    required String title,
    required String description,
  }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08 , vertical: height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IMAGE WITH SHADOW
            Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(image),
            ),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.primary
              ),
            ),

            SizedBox(height: height * 0.010),

            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: AppColor.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
