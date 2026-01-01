import 'package:asaneed/features/tree/presentation/views/tabs/tree_tabeen1.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NameBox extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const NameBox({
    Key? key,
    required this.title,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color backgroundColor =
    isDark ? const Color(0xff444444) : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 47,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
             Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.getBlack(context),
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TreeScreen extends StatelessWidget {
  const TreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColor.getAppBarColor(context),
        title: Text(
          "شجرة الاسنادية",
          style: AppColor.title.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.getBlack(context),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 280,
              height: 55,
              decoration: BoxDecoration(
                color: AppColor.primary4,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "محمد صلي الله عليه و سلم",
                  style: AppColor.title.copyWith(
                      fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildFakeTab("تابعي التابعين", Colors.transparent, AppColor.grey),
                const SizedBox(width: 8),
                buildFakeTab("التابعين", Colors.transparent, AppColor.grey),
                const SizedBox(width: 8),
                buildFakeTab("الصحابه", AppColor.purple, AppColor.purple2),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 12,
                itemBuilder: (context, index) {
                  final bool isDark = Theme.of(context).brightness == Brightness.dark;

                  return NameBox(
                    title: "جابر بن عبد الله الأنصاري",
                    color: isDark ? const Color(0xff444444) : Colors.purple,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 600),
                          pageBuilder: (context, animation, secondaryAnimation) =>
                          const TreeTabeen1(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final offsetAnimation = Tween<Offset>(
                              begin: const Offset(0.2, 0),
                              end: Offset.zero,
                            ).animate(CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOutCubic,
                            ));

                            return SlideTransition(
                              position: offsetAnimation,
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFakeTab(String title, Color bgColor, Color textColor) {
    return Container(
      width: 80,
      height: 27,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
