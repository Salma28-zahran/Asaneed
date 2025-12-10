import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NameBox extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const NameBox({
    Key? key,
    required this.title,
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
            // ✨ السهم فقط بدون خلفية
            Container(
              width: 35,
              height: 45,
              decoration: const BoxDecoration(
                color: Colors.transparent, // شلنا اللون الفوشيا
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black, // السهم أسود زي ما انتي عايزة
                  size: 18,
                ),
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

class TreeSahaba extends StatelessWidget {
  final TabController tabController;

  const TreeSahaba({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 12,
        itemBuilder: (context, index) {
          return NameBox(
            title: "جابر بن عبد الله الأنصاري",
            onTap: () {
              tabController.animateTo(1);
              debugPrint("Tapped on جابر $index");
            },
          );
        },
      ),
    );
  }
}
