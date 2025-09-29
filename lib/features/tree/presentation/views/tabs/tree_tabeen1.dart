import 'package:asaneed/features/tree/presentation/views/tabs/tree_tabeen1.dart';
import 'package:asaneed/features/tree/presentation/views/tabs/tree_tabeen2.dart' show TreeTabeen2;
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NameBox2 extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const NameBox2({
    Key? key,
    required this.title,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  State<NameBox2> createState() => _NameBoxState();
}

class _NameBoxState extends State<NameBox2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 47,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColor.pink,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 38,
              decoration: BoxDecoration(
                color:AppColor.pink2,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 16,
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

class TreeTabeen1 extends StatelessWidget {
  const TreeTabeen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(
          "الصحابه",
          style: AppColor.title.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "جابر بن عبد الله الأنصاري",
                style: AppColor.title.copyWith(
                    fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'اقرأ المزيد...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Row(
                  children: [

                    Text(
                      'تاريخ الوفاة 78 هجرية',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColor.purple,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'صحابي',
                        style: TextStyle(
                          color: AppColor.purple2,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildFakeTab("تابعي التابعين",Colors.transparent,AppColor.grey ),
                const SizedBox(width: 8),
                buildFakeTab("التابعي", AppColor.pink,AppColor.pink2 ),


              ],
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return NameBox2(
                    title: "عمرو بن دينار المكي ",
                    color: Colors.purple,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 600),
                          pageBuilder: (context, animation, secondaryAnimation) =>
                          const TreeTabeen2(),
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
