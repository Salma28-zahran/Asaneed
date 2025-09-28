import 'package:asaneed/features/tree/presentation/views/tabs/tree_tabeen1.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NameBox extends StatefulWidget {
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
  State<NameBox> createState() => _NameBoxState();
}

class _NameBoxState extends State<NameBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 47,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: widget.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 45,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
        backgroundColor: AppColor.white,
        title: Text(
          "شجرة الاسنادية",
          style: AppColor.title.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // البوكس بتاع الرسول ﷺ
            Container(
              width: 280,
              height: 55,
              decoration: BoxDecoration(
                color: AppColor.primary2,
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

            // شكل التابات بس كـ ديزاين
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

            // ليست فيها الأسماء
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return NameBox(
                    title: "جابر بن عبد الله الأنصاري",
                    color: Colors.purple,
                    onTap: () {
                      // ✅ يفتح صفحة TreeTabeen1 بأنيميشن
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:
                          const Duration(milliseconds: 600),
                          pageBuilder: (context, animation, secondaryAnimation) =>
                          const TreeTabeen1(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            final offsetAnimation = Tween<Offset>(
                              begin: const Offset(0.2, 0), // slide من اليمين
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
